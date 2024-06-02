<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('docacc', function (Blueprint $table) {
            $table->id('dc_id');
            $table->string('fname',60);
            $table->string('lname',60);
            $table->text('address');
            $table->text('city');
            $table->integer('pnm');
            $table->enum('gender',["M", "F" ,"O"]);
            $table->integer('age');
            $table->string('email',100)->unique();
            $table->string('password');
            $table->string('img1')->nullable();
            $table->string('role',20)->nullable();
            $table->unsignedBigInteger('dpt_id')->nullable()->constrained()->onDelete('cascade');
            $table->foreign('dpt_id')->references('dpt_id')->on('departmenttyp');
            $table->rememberToken();   
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('docacc');
    }
};
