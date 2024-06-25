<?php

namespace App\Http\Controllers\API;
use App\Models\DoctorModel;
use App\Models\PatientModel;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class UserApi extends Controller
{
    public function create(Request $request){ //create  acc
        $crt = new user;
        $valid= Validator::make($request->all(),[
            'fname' => 'required',
            'lname' => 'required',
            
            'email' => 'required|unique:patientacc',
            'password' => 'required |confirmed',
            'password_confirmation' => 'required ',
        ]);
        if($valid->fails()) {   
            $result = array('status' => false, 'message' =>"Validation Wrong",
            'error_message' => $valid->errors());
            return response()->json($result,400);
        }
     $crt->fname = $request['fname'];
     $crt->lname = $request['lname'];
     $crt->email = $request['email']; 
     $crt->password = hash::make($request['password']);
     $crt->role = $request['role'];
     $crt->save();
     if ($request->role == 'Patient') {
        $patient = new PatientModel();
        $patient->id = $crt->id;
        $patient->fname = $crt->fname;
        $patient->lname = $crt->lname;
        $patient->email = $crt->email;
        $patient->password = $crt->password;
        $patient->role = 'Patient';
        
        $patient->save(); // Save the patient to the database
    } elseif ($request->role == 'Doctor') {
        $doctor = new DoctorModel();
        $doctor->id = $crt->id;
        $doctor->fname = $crt->fname;
        $doctor->lname = $crt->lname;
        $doctor->email = $crt->email;
        $doctor->password = $crt->password;
        $doctor->role = 'Doctor';
        $doctor->save(); // Save the doctor to the database
    }
    if($crt->id){
        $result = array('status' => true, 'message' =>"Successfully created", "data" =>$patient);
        $rescode =200;
    }
    else{
        $result = array('status' => false, 'message' =>"Something went wrong");
        $rescode =400;
    }

    return response()->json($result,$rescode);

    }
}
