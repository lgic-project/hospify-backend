<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

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
                
                session(['sname'=> Auth::user()->name]);
                //session()->only(['sname'=> Auth::user()->name]);
                $route = $this->redirectDash();
               
                return redirect($route);
            } else {
                // Authentication failed, log and redirect back with error
                Log::info('Authentication failed for email: ' . $credentials['email']);

                return back()->withErrors(['error' => 'Invalid email or password.']);
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
                     $redirect = '/doctordash';
                     break;
                 case 'Nurse':
                     $redirect = '/nurse/view';
                     break;
                 case 'Patient':
                     $redirect = '/patientdash';
                     break;
                 default:
                     // Handle default redirection
                     break;
             }
             return $redirect;
         }
         return view('auth.failed');
       
    }
    

    public function authcrta(Request $request){
        $request -> validate([
            'email' => 'required| email',
            'password' => 'required'
        ]);
     $crt = new user;
     $crt->name = $request['name'];
     $crt->email = $request['email'];
     $crt->password = hash::make($request['password']);
     $crt->role = $request['role'];
     $crt->save();
     return redirect('/auth');

    }
    public function authcrt(){
        return view('auth.authcreate');
    }

}
