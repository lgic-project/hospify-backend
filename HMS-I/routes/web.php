<?php
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DocController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\NurseController;
use Illuminate\Support\Facades\Route;
use App\Models\PatientModel;



//prefixc
route::get('/login',[PatientController::class,'login'])->name('login');
route::post('/login',[PatientController::class,'logina'])->name('logina');
route::get('/log2',[PatientController::class,'das2'])->name('das2');
route::get('/logout',[PatientController::class,'logout'])->name('logout');
route::get('/', [PatientController::class,'index'])->name('pa.home');

route::get('/auth',[AuthController::class,'authlogin'])->name('authlogin');
route::post('/auth',[AuthController::class,'authlogina'])->name('authlogina');

Route::group(['middleware'=> ['Patient']], function () {
    

route::get('/patient',[PatientController::class,'paform'])->name('pa.add');
route::post('/paregister',[PatientController::class,'pastore'])->name('pa.save');
route::post('/patient', [PatientController::class,'pastore']);
route::get('/patient/view', [PatientController::class,'paview'])->name('pa.view');
route::get('/patient/edit/{id}',[PatientController::class,'paedit'])->name('pa.edit'); 
route::post('/patient/update/{id}',[PatientController::class,'paupdate'])->name('pa.update'); 
route::get('/patient/delete/{id}',[PatientController::class,'padelete'])->name('pa.delete'); 
});

Route::group(['middleware' => ['Doctor']], function () {
    

route::get('/doctor',[DocController::class,'dform'])->name('dc.add');
route::post('/dcregister',[DocController::class,'dstore'])->name('dc.save');
route::post('/dcdoctor', [DocController::class,'dstore']);
route::get('/doctor/view', [DocController::class,'dview'])->name('dc.view');
route::get('/doctor/edit/{id}',[DocController::class,'dedit'])->name('dc.edit'); 
route::post('/doctor/update/{id}',[DocController::class,'dupdate'])->name('dc.update'); 
route::get('/doctor/delete/{id}',[DocController::class,'ddelete'])->name('dc.delete'); 
});

Route::group(['middleware' => ['Nurse']], function () {
    

route::get('/nurse',[NurseController::class,'nform'])->name('nr.add');
route::post('/register',[NurseController::class,'nstore'])->name('nr.save');
route::post('/nurse', [NurseController::class,'nstore']);
route::get('/nurse/view', [NurseController::class,'nview'])->name('nr.view');
route::get('/nurse/edit/{id}',[NurseController::class,'nedit'])->name('nr.edit'); 
route::post('/nurse/update/{id}',[NurseController::class,'nupdate'])->name('nr.update'); 
route::get('/nurse/delete/{id}',[NurseController::class,'ndelete'])->name('nr.delete');
});