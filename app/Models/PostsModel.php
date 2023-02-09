<?php
namespace App\Models;

use CodeIgniter\Model;

class PostsModel extends Model
{
   protected $table = "posts";
   protected $primaryKey = "id";
   protected $allowedFields = [
      'author',
      'title',
      'description',
      'url',
      'source',
      'image',
      'category',
      'published_at'
   ];
}