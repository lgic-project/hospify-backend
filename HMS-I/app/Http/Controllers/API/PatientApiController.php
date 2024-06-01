<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PatientModel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
use App\Http\Controllers\md5;
use Illuminate\Support\Facades\Hash;
use Resourses\Views\hm;
use Illuminate\Support\Facades\Session;
use PHPUnit\Framework\Constraint\Count;

class PatientApiController extends Controller
{
    public function index(){
        return view('dashboard');
    }
    public function pastore(Request $request){
        $patient = new PatientModel; 
        $valid= Validator::make($request->all(),[
            'fname' => 'required',
            'lname' => 'required',
            'address' => 'required',
            'city' => 'required',
            'pnm' => 'required',
            'gender' => 'required',
            'age' => 'required',
            'email' => 'required|unique:patientacc',
            'password' => 'required |confirmed',
            'password_confirmation' => 'required ',
        ]);
        if($valid->fails()) {   
            $result = array('status' => false, 'message' =>"Validation Wrong",
            'error_message' => $valid->errors());
            return response()->json($result,400);
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
      
        $patient->role =$request['role'];
        $patient->save();
        
        if($patient->pa_id){
            $result = array('status' => true, 'message' =>"Successfully created", "data" =>$patient);
            $rescode =200;
        }
        else{
            $result = array('status' => false, 'message' =>"Something went wrong");
            $rescode =400;
        }

        return response()->json($result,$rescode);
    }
    public function paview(){
        $patient =  PatientModel::all();
        
        $result = array('status' => true, 'message' =>Count($patient)."User(s) fetched", "data" =>$patient);
        $rescode =200;
        return response()->json($result,$rescode);
    }
    public function paviewed($id){
        $patient =  PatientModel::find($id);
        if(!$patient){
            return response()->json(['status' => false, 'message' =>"User not found",404]);
        }
        $result = array('status' => true, 'message' =>"Your data", "data" =>$patient);
        $rescode =200;
        return response()->json($result,$rescode);
    }
    public function paup($id){
        $patient =  PatientModel::find($id);
        if(!$patient){
            return response()->json(['status' => false, 'message' =>"User not found",404]);
        }
        //$url=url('/paupdate')."/".$id;
        $url = route('pa.update.api', ['id' => $id]);
        return response()->json($patient,$url);
        // return view ('patient.paupdate',['patient' =>$patient,'url'=> $url]);
        // $result = array('status' => true, 'message' =>"Your data", "data" =>$patient);
        // $rescode =200;
        // ;
        // return response()->json([$result,$rescode, redirect('paupdate')]);
    }
    public function paupdate(Request $request , $id){
     
       $patient = PatientModel::find($id);
    
    //    if(!$patient){
    //     return response()->json(['status' => false, 'message' =>"User not found",404]);
    // }
    // $valid= Validator::make($request->all(),[
    //     'fname' => 'required',
    //     'lname' => 'required',
    //     'address' => 'required',
    //     'city' => 'required',
    //     'pnm' => 'required|numeric',// |digits:10, createma pani 
    //     'gender' => 'required',
    //     'age' => 'required',
    //     'email' => 'required',
    //     'password' => 'required |confirmed',
    //     'password_confirmation' => 'required ',
    // ]);
    // if($valid->fails()) {   
    //     $result = array('status' => false, 'message' =>"Validation Wrong",
    //     'error_message' => $valid->errors());
    //     return response()->json($result,400);
    // }
        $patient->fname =$request['fname']; 
        $patient->lname =$request['lname'];
        $patient->address =$request['address'];
        $patient->city =$request['city'];
        $patient->pnm =$request['pnm'];
        $patient->gender =$request['gender'];
        $patient->weight =$request['weight'];
        $patient->age =$request['age'];
        $patient->email =$request['email'];//des halni
        $patient->mh =$request['mh'];
      
        $patient->password =md5($request['password']);
        $patient->status =$request['status'];
        $patient->save();
        
        // $result = array('status' => true, 'message' =>"Successfully Updated", "data" =>$patient);
        $rescode =200;
        return response()->json($patient,$rescode);

    }
}
