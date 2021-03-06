<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsAdminTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    { 
Schema::create('productsAdmin', function (Blueprint $table) {
            $table->increments('id');
  
    
             $table->string('desc_ar')->nullable();
            $table->string('desc_en')->nullable();   

            $table->longtext('product_name_ar')->nullable();
            $table->longtext('product_name_en')->nullable();

            $table->string('photo')->nullable();
            
            $table->integer('department_id')->unsigned()->nullable();
            $table->foreign('department_id')->references('id')->on('departments')->onDelete('cascade');          
            $table->integer('trade_id')->unsigned()->nullable();
 
            $table->integer('nun_sms')->unsigned()->nullable();
            $table->integer('num_member')->unsigned()->nullable();
            $table->integer('date_month')->unsigned()->nullable();

            $table->decimal('price', 5, 2)->default(0);
   
            $table->longtext('other_data')->nullable();

             $table->timestamps();
        
        });  
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('productsAdmin');
    }
}
