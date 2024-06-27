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
        Schema::create('departmenttyp', function (Blueprint $table) {
            $table->id('dpt_id');
            $table->string('dpt_name',100);
            $table->text('dpt_des')->nullable();//description  
            $table->BigInteger('dc_id')->nullable()->constrained()->onDelete('cascade');
            $table->foreign('dc_id')->references('dc_id')->on('docacc');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('departmenttyp');
    }
};
