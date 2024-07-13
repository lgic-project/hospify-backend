<?php

namespace App\Http\Controllers;

use App\Models\AdminModel;
use App\Models\DoctorModel;
use App\Models\PatientModel;
use App\Models\User;
use Illuminate\Http\Request;
use App\Mail\ForgotPassword;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Resourses\Views\hm;
use Illuminate\Support\Facades\Session;



class AuthController extends Controller
{
    public function index(){
        return view('auth.failed');
    }
    
    public function authlogin(){
             return view('auth.authlog');
         }
        public function registered(){
           if(Auth::user()){
            $route = $this->redirectDash();
            return redirect($route);
           }
           return view('dashboard');   
        }
        public function loadlogin()
        {
            if(Auth::user()){
                $route = $this->redirectDash();
                return redirect($route);
            }
            return view('loginform');  
        }

       

        public function authlogina(Request $request)
        {
            // Validate the request data
            $request->validate([
                'email' => 'required|email',
                'password' => 'required'
            ]);
    
            $credentials = $request->only('email', 'password');
            
           
            if (Auth::attempt($credentials)) {
                
                session(['fname'=> Auth::user()->fname]);
                session(['sid'=> Auth::user()->id]);
                session(['role'=> Auth::user()->role]);
                Log::info('Session data after login:', session()->all());
                //session()->only(['sname'=> Auth::user()->name]);
                $route = $this->redirectDash();
               
                return redirect($route);
            } else {
                // Authentication failed, log and redirect back with error
                Log::info('Authentication failed for email: ' . $credentials['email']);

                return back()->withInput()->with(['message' => 'Invalid email or password.']);
            }
        }
    public function root(){
        if (auth::user() )
        $route = $this->redirectDash();
        return redirect($route);
    }
  
    public function redirectDash()
    {
        $redirect ='';
         if (Auth::check()) {
             $role = Auth::user()->role;
         Log::info('User role: ' . $role);
             switch (Auth::user()->role) { 
                 case 'Doctor':
                    $did = session('sid');
                    $user = User::find($did);
                    $dcid = $user->doctor->dc_id;
                    //$id = DoctorModel::where('dc_id', $did)->first();
                    session(['sid' => $dcid]);
                    Log::info('before redirect',['dc_id'=>$dcid]);
                     $redirect = '/doctordash';
                     break;
               
                 case 'Patient':
                    $did = session('sid');
                    $user = User::find($did);
                    $id = $user->patient->pa_id;
                    // $id = PatientModel::where('pa_id', $did)->first();
                    session(['sid' => $id]);
                    Log::info('before redirect',[$id]);
                     $redirect = '/patientdash';
                     break;
                 case 'Admin':
                    $did = session('sid');
                    $user = User::find($did);
                    $adid = $user->admin->a_id;
                   // $id = AdminModel::where('a_id', $did)->first();
                    Log::info('before session',[$adid]);
                    session(['sid' => $adid]);
                    Log::info('before redirect',[$adid]);
                     $redirect = '/ddash';
                     break;
                     
             } 
             return $redirect;
         }
         return view('auth.failed');
       
    }
    

    public function authcrta(Request $request){ //create  acc
        $request -> validate([
            'email' => 'required| email',
            'password' => 'required'
        ]);
    
     $crt = new user;
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
    } 
     elseif ($request->role == 'Doctor') {
        $doctor = new DoctorModel();
        $doctor->id = $crt->id;
        $doctor->fname = $crt->fname;
        $doctor->lname = $crt->lname;
        $doctor->email = $crt->email;
        $doctor->password = $crt->password;
        $doctor->role = 'Doctor';
        $doctor->save(); // Save the doctor to the database
    }
    elseif ($request->role == 'Admin'){
        $ad = new AdminModel();
        $ad->id = $crt->id;
        $ad->fname = $crt->fname;
        $ad->lname = $crt->lname;
        $ad->email = $crt->email;
        $ad->password = $crt->password;
        $ad->role = 'Admin';
        $ad->save(); 
    }
     return redirect('/auth');

    }
    public function authcrt(){
        return view('auth.authcreate');
    }

    public function logout(){
        Auth::logout();
        Session::forget('sid');
           // not working
        
        return redirect ()->route('authlogin');
    }

    public function forgot(){
        return view('auth.forgot');
    }
    public function forgotpost(request $request){
        log::info('Request data:', $request->all());
        $user = User::where('email', $request->email)->first();
        //log::info('Request data:', [$user]);
        if($user){
            $user->remember_token= Str::random(40);
            $user->save();
            $formdata= [ 
                'token'=> $user->remember_token,
                'user' => $user];
                Log::info('before sending mail ' ,[ $formdata]);
            Mail::to($request->email)->send(new ForgotPassword($formdata));
            return redirect()->back()->with('message', "Check your mail for reset password link");

    }
    else{
        return redirect()->back()->with('message', 'Email not found');
    }
    }
    // public function forgotpost(request $request){
    //     $user = User::where('email', $request->email)->first();
    //     try {
    //         Log::info('Attempting to send email to: ' . $user->email);
    //         Mail::to($user->email)->send(new ForgotPassword($user));
    //         Log::info('Password reset email sent successfully.');
    //     } catch (\Exception $e) {
    //         Log::error('Error sending password reset email: ' . $e->getMessage());
    //         return redirect()->back()->with('error', 'Error sending password reset email.');
    //     }
        
    // }

    public function admin($id){
        $admin  = AdminModel::where('a_id', $id)->first();
        
       if (is_null($admin )){
           return redirect()->back();
           // $patient = Patientacc::where('pa_id', $id)->delete();
       }
       else{
          
           $data = compact('admin');
           return view('dashboard.adminpro')->with( $data);
       }

    } 
    public function adminup(Request $request , $id){
        dd($request);
        $admin  = AdminModel::find($id); 
        dd($admin);
   
    $admin ->fname =$request['fname'];
    $admin ->lname =$request['lname'];
    $admin ->address =$request['address'];
    $admin ->city =$request['city'];
    $admin ->pnm =$request['pnm'];
    $admin ->gender =$request['gender'];
    $admin ->age =$request['age'];
    $admin ->role =$request['role'];
    $admin ->email =$request['email'];
    $admin ->password =hash::make($request['password']);
    dd($admin);
    //$admin->save();

    $user = User::find($id);
    $user ->fname =$request['fname'];
    $user ->lname =$request['lname'];
    $user ->email =$request['email'];
    $user ->password =hash::make($request['password']);
   
    $user->save();
    
    //return redirect('/ddash');

    }
}