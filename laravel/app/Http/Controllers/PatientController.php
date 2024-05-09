<?php

namespace App\Http\Controllers;
use App\Models\PatientModel;
use Illuminate\Http\Request;
use Resourses\Views\hm;

class PatientController extends Controller
{
    public function index(){
        return view('dashboard');
    }
    public function form(){
        //create
        $url = url('/register');
        $patient = new PatientModel();
        $title=" Patient registration";
        $data = compact('url','title','patient');
        return view('form')->with( $data);
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
        $patient = new PatientModel;
        $patient->fname =$request['fname'];
        $patient->lname =$request['lname'];
        $patient->address =$request['address'];
        $patient->city =$request['city'];
        $patient->pnm =$request['pnm'];
        $patient->gender =$request['gender'];
        $patient->age =$request['age'];
        $patient->email =$request['email'];
        $patient->password =md5($request['password']);
        $patient->save();
        return redirect('/patient/view');


    }
    public function view(){
        $patient =  PatientModel::all();
        
        $data = compact('patient');
        return view ('patient.patient-view')->with($data);
         
    }
public function padelete($id)
{
    // Fetch the patient record(s) based on the provided ID
    $patient = PatientModel::where('pa_id', $id)->get();
    if (!is_null($patient)){
        $patient = PatientModel::where('pa_id', $id)->delete();
    }

    return redirect('/patient/view');

    
    // Check if any records are found
    // if ($patient->isEmpty()) {
    //     // Handle case when no records are found
    //     echo "No patient found with the provided ID.";
    // } else {
    //     $patient = Patientacc::where('pa_id', $id)->delete();
       
    // }
}

public function paedit($id){
    //$patient=Patientacc::find($id);
     $patient = PatientModel::where('pa_id', $id)->first();
    if (is_null($patient)){
        return redirect('/patient/view');
        // $patient = Patientacc::where('pa_id', $id)->delete();
    }
    else{
        $title="Update  Patient";
        $url=url('/patient/update/')."/".$id;
        $data = compact('patient','url','title');
        return view('form')->with( $data);
    }

}
public function paupdate(Request $request , $id){
    //$patient = Patientacc::where('pa_id', $id)->first();
   //dd($patient);
   $patient = PatientModel::find($id);
   
    $patient->fname =$request['fname'];
    $patient->lname =$request['lname'];
    $patient->address =$request['address'];
    $patient->city =$request['city'];
    $patient->pnm =$request['pnm'];
    $patient->gender =$request['gender'];
    $patient->age =$request['age'];
    $patient->email =$request['email'];
    $patient->save();
    return redirect('/patient/view');

}
}
