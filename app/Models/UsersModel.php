<?php
namespace App\Models;

use CodeIgniter\Model;

class UsersModel extends Model
{
   protected $table = "users";
   protected $primaryKey = "id";
   protected $allowedFields = [
      'username',
      'password',
      'firstname',
      'lastname',
      'email',
      'dob',
      'profile_pic'
   ];
}