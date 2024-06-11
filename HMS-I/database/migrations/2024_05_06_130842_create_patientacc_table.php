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
            $table->text('address')->nullable();
            $table->text('city')->nullable();
            $table->integer('pnm')->nullable();
            $table->enum('gender',["M", "F" ,"O"])->nullable();
            $table->integer('age')->nullable();
            $table->integer('weight')->nullable();
            $table->text('mh')->nullable();
            $table->string('email',100)->unique();
            $table->boolean('status')->nullable();
            $table->string('password');
            $table->string('img1')->nullable();
            $table->string('role',20)->nullable();
            $table->foreignId('id')->constrained('users')->onDelete('cascade');
            $table->bigInteger('dpt_id')->nullable()->constrained()->onDelete('cascade');   
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
        Schema::dropIfExists('patientacc');
    }
};
