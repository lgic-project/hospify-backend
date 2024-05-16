<?php

namespace App\Http\Controllers;
use App\Models\PatientModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Resourses\Views\hm;

class PatientController extends Controller
{
    public function index(){
        return view('dashboard');
    }
    public function paform(){
        //create
        // $url = url('/register');
        // $patient = new PatientModel();
        // $title=" Patient registration";
        // $data = compact('url','title','patient');
        // return view('patient.form')->with( $data);
        return view('patient.form');
    }
    public function paregister(Request $request){
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
        'img1' => 'nullable|mimes:png,jpeg,jpg,webp',
            ]);
       

    }
    public function pastore(Request $request){
        // echo"<pre>";
        // print_r($request->all());   
        $patient = new PatientModel; 
        if($request->has('img1')){

            $file = $request->file('img1');
            $extn= $file->getClientOriginalExtension();
            $filename = time().'PA.'.$extn;
            $path ='upload/pacimg/';
            $file->move($path,$filename);
        }
        
        $patient->fname =$request['fname'];
        $patient->lname =$request['lname'];
        $patient->address =$request['address'];
        $patient->city =$request['city'];
        $patient->pnm =$request['pnm'];
        $patient->gender =$request['gender'];
        $patient->age =$request['age'];
        $patient->email =$request['email'];
        $patient->password =md5($request['password']);
        $patient->img1=$path.$filename;
        $patient->save();
        return redirect('/patient/view');


    }
    public function paview(){
        $patient =  PatientModel::all();
        
        $data = compact('patient');
        return view ('patient.patient-view')->with($data);
         
    }
public function padelete($id)
{
    // Fetch the patient record(s) based on the provided ID
    $patient = PatientModel::where('pa_id', $id)->first();
    if (!is_null($patient)){
        if(File::exists($patient->img1)){
            File::delete($patient->img1);
        } 
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
        $title="Update  Patient ";
        $url=url('/patient/update/')."/".$id;
        $data = compact('patient','url','title');
        return view('patient.paupdate')->with( $data);
        
    }

} 
public function paupdate(Request $request , $id){
    //$patient = Patientacc::where('pa_id', $id)->first();
   //dd($patient);
   $patient = PatientModel::find($id);
   if($request->has('img1')){

    $file = $request->file('img1');
    $extn= $file->getClientOriginalExtension();
    $filename = time().'PA.'.$extn;
    $path ='upload/pacimg/';
    $file->move($path,$filename);
    if(File::exists($patient->img1)){
        File::delete($patient->img1);
    }
}
   
    $patient->fname =$request['fname']; 
    $patient->lname =$request['lname'];
    $patient->address =$request['address'];
    $patient->city =$request['city'];
    $patient->pnm =$request['pnm'];
    $patient->gender =$request['gender'];
    $patient->weight =$request['weight'];
    $patient->age =$request['age'];
    $patient->email =$request['description'];
    $patient->mh =$request['mh'];
    $patient->img1=$path.$filename;
    $patient->password =md5($request['password']);
    $patient->status =$request['status'];
    $patient->save();
    return redirect('/patient/view');

}
}
