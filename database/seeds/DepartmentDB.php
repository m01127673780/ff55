<?php

use Illuminate\Database\Seeder;
use App\Model\Department;

class DepartmentDB extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i <1; $i++){

        	$add = new  Department;
         	$add->dep_name_ar   = 'vodafone';
            $add->dep_name_en   = 'vodafone';
        	$add->save();
    }
}

}