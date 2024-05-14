<?php

use App\Http\Controllers\DocController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\NurseController;
use Illuminate\Support\Facades\Route;
use App\Models\PatientModel;

route::get('/', [PatientController::class,'index'])->name('pa.home');
route::get('/patient',[PatientController::class,'paform'])->name('pa.add');
route::post('/paregister',[PatientController::class,'pastore'])->name('pa.save');
route::post('/patient', [PatientController::class,'pastore']);
route::get('/patient/view', [PatientController::class,'paview'])->name('pa.view');
route::get('/patient/edit/{id}',[PatientController::class,'paedit'])->name('pa.edit'); 
route::post('/patient/update/{id}',[PatientController::class,'paupdate'])->name('pa.update'); 
route::get('/patient/delete/{id}',[PatientController::class,'padelete'])->name('pa.delete'); 

// Route::get('/patients', [PatientController::class, 'index'])->name('patients.index');
// Route::get('/patients/create', [PatientController::class, 'create'])->name('patients.create');
// Route::post('/patients', [PatientController::class, 'store'])->name('patients.store');
// Route::get('/patients/{patient}', [PatientController::class, 'show'])->name('patients.show');
// Route::get('/patients/{patient}/edit', [PatientController::class, 'edit'])->name('patients.edit');
// Route::put('/patients/{patient}', [PatientController::class, 'update'])->name('patients.update');
// Route::delete('/patients/{patient}', [PatientController::class, 'destroy'])->name('patients.destroy');


route::get('/doctor',[DocController::class,'dform'])->name('dc.add');
route::post('/dcregister',[DocController::class,'dstore'])->name('dc.save');
route::post('/dcdoctor', [DocController::class,'dstore']);
route::get('/doctor/view', [DocController::class,'dview'])->name('dc.view');
route::get('/doctor/edit/{id}',[DocController::class,'dedit'])->name('dc.edit'); 
route::post('/doctor/update/{id}',[DocController::class,'dupdate'])->name('dc.update'); 
route::get('/doctor/delete/{id}',[DocController::class,'ddelete'])->name('dc.delete'); 

route::get('/nurse',[NurseController::class,'nform'])->name('nr.add');
route::post('/register',[NurseController::class,'nstore'])->name('nr.save');
route::post('/nurse', [NurseController::class,'nstore']);
route::get('/nurse/view', [NurseController::class,'nview'])->name('nr.view');
route::get('/nurse/edit/{id}',[NurseController::class,'nedit'])->name('nr.edit'); 
route::post('/nurse/update/{id}',[NurseController::class,'nupdate'])->name('nr.update'); 
route::get('/nurse/delete/{id}',[NurseController::class,'ndelete'])->name('nr.delete'); 