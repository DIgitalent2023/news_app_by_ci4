<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\CommentsModel;
use App\Models\PostsModel;
use App\Models\UsersModel;
use Config\Services;

class Comments extends BaseController
{
   use ResponseTrait;

   public function index($id=0)
   {
      $data = $this->compile($id);

      return $this->respond([
         'status' => 1,
         'data' => $data
      ], 200);
   }

   public function compile($id=0)
   {
      $CommentsModel = new CommentsModel();

      if ($id > 0)
      {
         $comments = $CommentsModel->where('id', $id)->find();
      }
      else
      {
         $comments = $CommentsModel->where('published >', 0)->findAll();
      }
  $dataz=[];
  $UsersModel = new UsersModel();
  $postModel = new PostsModel();
  if(count($comments) > 0){
   foreach($comments as $val){
      $id=$val['id'];
      $user_id=$val['user_id'];
      $user=$UsersModel ->where('id',$user_id)->first();

        $post_id=$val['post_id'];
      $post=$postModel ->where('id',$post_id)->first();
      $content = $val['content'];
      $dataz[]=[
         'id'=>$id,
         'user'=>$user,
         'post'=>$post,
         'content'=>$content

      ];

   }
   return $dataz;
  }

      
   
   }


   public function add_comment()
   {

      $rules =[
         'user_id' => 'required|integer',
         'post_id' => 'required|integer',
         'content' => 'required',
         'date'=>'required',
      ];
      $val = $this->validate($rules);

      if (!$val)
      {
         return $this->respond([
            'status' => 0,
            'message' => Services::validation()->getErrors()
         ], 400);
      }
      else
      { 
         $user_id = $this->request->getVar('user_id');
         $UsersModel = new UsersModel();
         $user = $UsersModel ->where('id',$user_id)->find();
         $post_id = $this->request->getVar('post_id');
         $postModel = new PostsModel();
         $post = $postModel ->where('id',$post_id)->find();
         if(!$user){
            return $this->respond([
               'status' => 0,
               'messge' =>'User not found'
            ],403);
         }
        else if(!$post){
            return $this->respond([
               'status' => 0,
               'messge' =>'Post not found'
            ],403);
         }

   else{
         $data = [
            'user_id' => $this->request->getVar('user_id'),
            'post_id' => $this->request->getVar('post_id'),
             'content' => $this->request->getVar('content'),
             'date' => $this->request->getVar('date')
         ];

         $CommentsModel = new CommentsModel();
         $CommentsModel->insert($data);
         $id = $CommentsModel->insertID;

         $data = $this->compile($id);

         return $this->respond([
            'status' => 1,
            'message' => "Comment from ".$user[0]['firstname']." was added on ".$post[0]['title']." succesfully",
            'data' => $data
         ], 201);
      }
      }
   }

   public function moderate_comment($id=0)
   {
      if ($id == 0)
      {
         return $this->respond([
            'status' => 0,
            'message' => "id missing"
         ], 400);
      }
      else
      {
         $rules =[
            'published' => 'required'
         ];
         $val = $this->validate($rules);
  
         if (!$val)
         {
            return $this->respond([
               'status' => 0,
               'message' => Services::validation()->getErrors()
            ], 400);
         }
         else
         {
            $CommentsModel = new CommentsModel();
            $data = [
        
               'published'       => $this->request->getVar('published'),
            ];

            $CommentsModel->update($id, $data);
            $data = $this->compile($id);
            return $this->respond([
               'status' => 1,
               // 'message' => "User updated successfully",
               'data' => $data
            ], 200);
         }
      }
   }


   // public function delete_user($id=0)
   // {
   //    if ($id == 0)
   //    {
   //       return $this->respond([
   //          'status' => 0,
   //          'message' => "id missing"
   //       ], 400);
   //    }
   //    else
   //    {
   //       $data = $this->compile($id);

   //       $CommentsModel = new CommentsModel();

   //       $CommentsModel->delete($id);

   //       return $this->respond([
   //          'status' => 1,
   //          'message' => "User deleted successfully",
   //          'data' => $data
   //       ], 200);
   //    }
   // }
}
