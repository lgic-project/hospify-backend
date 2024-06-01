<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\PatientApiController;
use App\Http\Controllers\API\DoctorApiController;
use App\Http\Controllers\API\NurseApiController;

//next migration ma img lai nullable banauni

use App\Http\Controllers\DocController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\NurseController;
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get("index",[PatientapiController::class,'index']);
Route::get("paview",[PatientApiController::class,'paview']);
Route::get("paview-detail/{id}",[PatientApiController::class,'paviewed']); //viewed lai viewid banauni
Route::get("paup/{id}",[PatientApiController::class,'paup']);
Route::post("paregister",[PatientApiController::class,'pastore']);
Route::post("paupdate/{id}",[PatientApiController::class,'paupdate'])->name('pa.update.api');   



Route::post("dcregister",[DoctorApiController::class,'dcstore']);
Route::post("dcupdate/{id}",[DoctorApiController::class,'dcupdate']);
Route::get("dcview",[DoctorApiController::class,'dcview']);
Route::get("dcview-detail/{id}",[DoctorApiController::class,'dcviewed']);   

Route::post("nrregister",[NurseApiController::class,'nrstore']);//error aye pani data janxa error ayo bhanw data save nahuni bananuni
Route::get("nrview",[NurseApiController::class,'nrview']);
Route::get("nrview-detail/{id}",[NurseApiController::class,'nrviewed']);