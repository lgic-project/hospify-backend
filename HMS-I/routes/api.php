<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\PatientApiController;



use App\Http\Controllers\DocController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\NurseController;
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get("index",[PatientController::class,'index']);
Route::get("paview",[PatientApiController::class,'paview']);
Route::get("paview-detail/{id}",[PatientApiController::class,'paviewed']);    
Route::post("paregister",[PatientApiController::class,'pastore']);  