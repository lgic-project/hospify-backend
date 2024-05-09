<?php

namespace App\Http\Controllers;

use App\Models\DoctorModel;
use Illuminate\Http\Request;

class DocController extends Controller
{
    public function index(){
        return view('dashboard');
    }
    public function form(){
        //create
        $url = url('/register');
        $doctor = new DoctorModel();
        $title=" Doctor registration";
        $data = compact('url','title','doctor');
        return view('doctor.docform')->with( $data);
    }
    public function register(Request $request){
        $request->validate(
            [
        'fname' => 'required',
        'lname' => 'required',
        'address' => 'required',
        'city' => 'required',
        'pnm' => 'required',
        'gender' => 'required',
        'age' => 'required',
        'email' => 'required',
        'password' => 'required |confirmed',
        'password_confirmation' => 'required ',
            ]);
        

    }
    public function store(Request $request){
        // echo"<pre>";
        // print_r($request->all());    
        $doctor  = new DoctorModel;
        $doctor ->fname =$request['fname'];
        $doctor ->lname =$request['lname'];
        $doctor ->address =$request['address'];
        $doctor ->city =$request['city'];
        $doctor ->pnm =$request['pnm'];
        $doctor ->gender =$request['gender'];
        $doctor ->age =$request['age'];
        $doctor ->email =$request['email'];
        $doctor ->password =md5($request['password']);
        $doctor ->save();
        return redirect('/doctor/view');


    }
    public function view(){
        $doctor  =  DoctorModel::all();
        
        $data = compact('doctor');
        return view ('doctor.doc-view')->with($data);
         
    }
public function ddelete($id)
{
    // Fetch the patient record(s) based on the provided ID
    $doctor  = DoctorModel::where('dc_id', $id)->get();
    if (!is_null($doctor )){
        $patient = DoctorModel::where('dc_id', $id)->delete();
    }

    return redirect('/doctor/view');

    
    // Check if any records are found
    // if ($patient->isEmpty()) {
    //     // Handle case when no records are found
    //     echo "No patient found with the provided ID.";
    // } else {
    //     $patient = Patientacc::where('pa_id', $id)->delete();
       
    // }
}

public function dedit($id){
    //$patient=Patientacc::find($id);
     $doctor  = DoctorModel::where('dc_id', $id)->first();
    if (is_null($doctor )){
        return redirect('/doctor/view');
        // $patient = Patientacc::where('pa_id', $id)->delete();
    }
    else{
        $title="Update  Doctor";
        $url=url('/doctor/update/')."/".$id;
        $data = compact('doctor','url','title');
        return view('doctor.docform')->with( $data);
    }

}
public function dupdate(Request $request , $id){
    //$patient = Patientacc::where('pa_id', $id)->first();
   //dd($patient);
   $doctor  = DoctorModel::find($id);
   
    $doctor ->fname =$request['fname'];
    $doctor ->lname =$request['lname'];
    $doctor ->address =$request['address'];
    $doctor ->city =$request['city'];
    $doctor ->pnm =$request['pnm'];
    $doctor ->gender =$request['gender'];
    $doctor ->age =$request['age'];
    $doctor ->email =$request['email'];
    $doctor ->save();
    return redirect('/doctor/view');

}
}
