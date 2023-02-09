<?php
namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\API\ResponseTrait;

class BasicAuthFilter implements FilterInterface 
{
   use ResponseTrait;

   public function before(RequestInterface $request, $arguments = null)
   {
      $response = service('response');

      if (empty($_SERVER['PHP_AUTH_USER']))
      {
         $response->setJson([
            'message' => 'You must login to use this service',
            'status' => 0
         ]);
         $response->setStatusCode(401);
         return $response;
      }
      else
      {
         $username = $_SERVER['PHP_AUTH_USER'];
         $password = $_SERVER['PHP_AUTH_PW'];

         if ($username != "wsh" || $password != "123456")
         {
            $response->setJson([
               'message' => 'Wrong credentials',
               'status' => 0
            ]);
            $response->setStatusCode(401);
            return $response;
         }
      }
   }

   public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
   {

   }
}