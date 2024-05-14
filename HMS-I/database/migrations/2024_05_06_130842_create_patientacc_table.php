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
        Schema::create('patientacc', function (Blueprint $table) {
            $table->id('pa_id');
            $table->string('fname',60);
            $table->string('lname',60);
            $table->text('address');
            $table->text('city');
            $table->integer('pnm');
            $table->enum('gender',["M", "F" ,"O"]);
            $table->integer('age');
            $table->integer('weight');
            $table->text('mh');
            $table->string('email',100)->unique();
            $table->boolean('status');
            $table->string('password');
            $table->rememberToken();   
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patientacc');
    }
};
