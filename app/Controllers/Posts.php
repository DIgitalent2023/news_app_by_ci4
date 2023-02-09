<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\UsersModel;
use App\Models\PostsModel;
use App\Models\CommentsModel;

use Config\Services;

class Posts extends BaseController
{
   use ResponseTrait;

   

   public function index()
   {
      $PostsModel = new PostsModel();

      $date = date("Y-m-d");
      $dataz = $PostsModel->like('published_at', $date)->find();

      if (count($dataz) == "0")
      {

         $url = "http://api.mediastack.com/v1/news?access_key=f32591403d2b1dc28ff8769ad5f63a27&languages=en&countries=us&date=$date";
         //echo $url;

         $curl = curl_init();
         curl_setopt_array($curl, array(
         CURLOPT_URL => $url,
         CURLOPT_RETURNTRANSFER => true,
         CURLOPT_ENCODING => '',
         CURLOPT_MAXREDIRS => 10,
         CURLOPT_TIMEOUT => 0,
         CURLOPT_FOLLOWLOCATION => true,
         CURLOPT_SSL_VERIFYPEER =>  TRUE,
         CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
         CURLOPT_CUSTOMREQUEST => 'GET',
         ));

         $response = curl_exec($curl);
         $httpcode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
         $errmsg  = curl_error( $curl );

         curl_close($curl);

         $res = json_decode($response, true);

         foreach($res['data'] as $vl)
         {
            $data = [
               'author' => $vl['author'],
               'title' => $vl['title'],
               'description' => $vl['description'],
               'url' => $vl['url'],
               'source' => $vl['source'],
               'image' => $vl['image'],
               'category' => $vl['category'],
               'published_at' => $vl['published_at']
            ];

            //echo "<pre>" . print_r($data) . "</pre>";

            $PostsModel->insert($data);
            //echo $PostsModel->getLastQuery() . "<br>";
         }

         $dataz = $PostsModel->like('published_at', $date)->find();
      }

      return $this->respond([
         'status' => 1,
         'data' => $dataz
      ], 200);
   
   }

   public function get_posts(){

      //initialize model objects
      $PostsModel = new PostsModel();
      $CommentsModel = new CommentsModel();

      //getting todays date
      $date = date("Y-m-d");
     
      //Creating an empty array
      $result=[];

      //calling all posts of todays date
      $dataz = $PostsModel->like('published_at', $date)->find();

      //Looping through all posts received
      foreach($dataz as $val){

         //getting id from each post
         $id= $val['id'];

         //using post id from above, going to comments to get records if available
         $comments = $CommentsModel->where('post_id', $id)->findAll();

         //adding comments into each post
         $val['comments']=$comments;
         
         //using our array to re-create dataz with a new child called comments
         $result[]=$val;
         

      }
      
      return $this->respond([
         'status' => 1,
         'data' => $result
      ], 200);
   }


   
}
