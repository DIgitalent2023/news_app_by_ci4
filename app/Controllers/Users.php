<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\UsersModel;
use Config\Services;

class Users extends BaseController
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
      $UsersModel = new UsersModel();

      if ($id > 0)
      {
         $users = $UsersModel->where('id', $id)->find();
      }
      else
      {
         $users = $UsersModel->findAll();
      }

      return $users;
   }

   public function add_user()
   {
      $rules =[
         'firstname' => 'required',
         'lastname' => 'required',
         'email' => 'required|valid_email|is_unique[users.email]',
         'password' => 'required',
         'dob' => 'required'
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
         $data = [
            'firstname' => $this->request->getVar('firstname'),
            'lastname'  => $this->request->getVar('lastname'),
            'email'     => $this->request->getVar('email'),
            'password'  => $this->request->getVar('password'),
            'dob'       => $this->request->getVar('dob')
         ];

         $UsersModel = new UsersModel();
         $UsersModel->insert($data);
         $id = $UsersModel->insertID;

         $data = $this->compile($id);

         return $this->respond([
            'status' => 1,
            'message' => "User created successfully",
            'data' => $data
         ], 201);
      }
   }

   public function edit_user($id=0)
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
            'firstname' => 'required',
            'lastname' => 'required',
            'email' => 'required|valid_email',
            'password' => 'required',
            'dob' => 'required'
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
            $UsersModel = new UsersModel();

            $data = [
               'firstname' => $this->request->getVar('firstname'),
               'lastname'  => $this->request->getVar('lastname'),
               'email'     => $this->request->getVar('email'),
               'password'  => $this->request->getVar('password'),
               'dob'       => $this->request->getVar('dob'),
            ];


            $UsersModel->update($id, $data);
            
            $data = $this->compile($id);

            return $this->respond([
               'status' => 1,
               'message' => "User updated successfully",
               'data' => $data
            ], 200);
         }
      }
   }


   public function delete_user($id=0)
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
         $data = $this->compile($id);

         $UsersModel = new UsersModel();

         $UsersModel->delete($id);

         return $this->respond([
            'status' => 1,
            'message' => "User deleted successfully",
            'data' => $data
         ], 200);
      }
   }
}
