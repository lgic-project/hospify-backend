<?php

use App\Http\Controllers\DocController;
use App\Http\Controllers\PatientController;
use Illuminate\Support\Facades\Route;
use App\Models\PatientModel;

route::get('/', [PatientController::class,'index'])->name('pa.home');
route::get('/patient',[PatientController::class,'form'])->name('pa.add');
route::post('/register',[PatientController::class,'store']);
route::post('/patient', [PatientController::class,'store']);
route::get('/patient/view', [PatientController::class,'view'])->name('pa.view');
route::get('/patient/edit/{id}',[PatientController::class,'paedit'])->name('pa.edit'); 
route::post('/patient/update/{id}',[PatientController::class,'paupdate'])->name('pa.update'); 
route::get('/patient/delete/{id}',[PatientController::class,'padelete'])->name('pa.delete'); 


route::get('/doctor',[DocController::class,'form'])->name('dc.add');
route::post('/register',[DocController::class,'store']);
route::post('/doctor', [DocController::class,'store']);
route::get('/doctor/view', [DocController::class,'view'])->name('dc.view');
route::get('/doctor/edit/{id}',[DocController::class,'dedit'])->name('dc.edit'); 
route::post('/doctor/update/{id}',[DocController::class,'dupdate'])->name('dc.update'); 
route::get('/doctor/delete/{id}',[DocController::class,'ddelete'])->name('dc.delete'); 
