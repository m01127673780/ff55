<?php

use Illuminate\Database\Seeder;
use App\Admin;

class AdminDB extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i <1; $i++){

        	$add = new  Admin;
        

        $add['name'] = "Admin";
        $add['email'] = "admin@admin.com";
        $add['password'] = bcrypt(123456);
        $add['group_id'] = 1;
        $add->save();

         }
    }
}
 