<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\File;
use App\Models\DoctorModel;
use Illuminate\Http\Request;

class DocController extends Controller
{
    public function index(){
        return view('dashboard');
    }
    public function dcdash(){
        return view('doctor.dc-dash');
    }
    public function dcform(){
        //create
        // $url = url('/register');
        // $doctor = new DoctorModel();
        // $title=" Doctor registration";
        // $data = compact('url','title','doctor');
        // return view('doctor.docform')->with( $data);
         return view('doctor.docform');
    }
    public function dregister(Request $request){
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
    public function dstore(Request $request){
        // echo"<pre>";
        // print_r($request->all());    
        $doctor  = new DoctorModel;
        // if($request->has('img1')){

        //     $file = $request->file('img1');
        //     $extn= $file->getClientOriginalExtension();
        //     $filename = time().'DC.'.$extn;
        //     $path ='upload/pacimg/';
        //     $file->move($path,$filename);
        // }
        $doctor ->fname =$request['fname'];
        $doctor ->lname =$request['lname'];
        $doctor ->address =$request['address'];
        $doctor ->city =$request['city'];
        $doctor ->pnm =$request['pnm'];
        $doctor ->gender =$request['gender'];
        $doctor ->age =$request['age'];
        $doctor ->email =$request['email'];
        $doctor ->password =md5($request['password']);
        //$doctor->img1=$path.$filename;
        $doctor->role =$request['role'];
        $doctor ->save();
        return redirect('/doctor/view');


    }
    public function dview(){
        $doctor  =  DoctorModel::all();
        
        $data = compact('doctor');
        return view ('doctor.doc-view')->with($data);
         
    }
public function ddelete($id)
{
    // Fetch the patient record(s) based on the provided ID
    $doctor  = DoctorModel::where('dc_id', $id)->first();
    if (!is_null($doctor )){
        if(File::exists($doctor->img1)){
            File::delete($doctor->img1);
        } 
        $doctor = DoctorModel::where('dc_id', $id)->delete();
    }

    return redirect('/doctor/view');

    
    
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
        return view('doctor.docupdate')->with( $data);
    }

}
public function dupdate(Request $request , $id){
    //$patient = Patientacc::where('pa_id', $id)->first();
   //dd($patient);
 
   $doctor  = DoctorModel::find($id);
//    if($request->has('img1')){

//     $file = $request->file('img1');
//     $extn= $file->getClientOriginalExtension();
//     $filename = time().'DC.'.$extn;
//     $path ='upload/pacimg/';
//     $file->move($path,$filename);
//     if(File::exists($doctor->img1)){
//         File::delete($doctor->img1);
//     }
// }
   
    $doctor ->fname =$request['fname'];
    $doctor ->lname =$request['lname'];
    $doctor ->address =$request['address'];
    $doctor ->city =$request['city'];
    $doctor ->pnm =$request['pnm'];
    $doctor ->gender =$request['gender'];
    $doctor ->age =$request['age'];
    $doctor ->email =$request['email'];
    $doctor ->password =md5($request['password']);
   // $doctor->img1=$path.$filename; 
    
    $doctor ->save();
    return redirect('/doctor/view');

}
}
