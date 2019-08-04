<?php

namespace App\Model;
/*

 

*/
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
   protected $table    = 'products';
   protected $fillable = [
 
      'product_name_ar',
      'product_name_en',
      'desc_ar',
      'desc_en',
      'photo',
       'price',
       'nun_sms',
       'num_member',
       'date_month',
       'department_id',
         
   ];
public function department_id() {
    return $this->hasOne('App\Model\Department', 'id', 'department_id');
  }

   // public function files()
   // {
   //    return $this->hasMany('App\File','relation_id','id')->where('file_type','product');
   // }
}
