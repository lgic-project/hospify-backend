<?php

namespace App\Http\Controllers;
use App\Models\PatientModel;
use App\Models\DoctorModel;
use App\Models\NurseModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use App\Http\Controllers\md5;
use Illuminate\Support\Facades\Log;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Resourses\Views\hm;
use Illuminate\Support\Facades\Session;



class AuthController extends Controller
{
    public function authlogin(){
             return view('loginform');
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

        // public function authlogina( Request $request){

        //     $request -> validate([
        //         'email' => 'required| email',
        //         'password' => 'required'
        //     ]);
        //     $usercred = $request-> only('email','password');
        //     if(Auth::attempt($usercred)){
        //         // $route = $this ->redirectDash();
        //         // return redirect($route);
        //         Log::info('Authentication successful for email: ' . $usercred['email']);
        // $route = $this->redirectDash();
        // Log::info('Redirect route: ' . $route);
        // return redirect($route);
        //     }
        //     else{
        //         Log::warning('Authentication failed for email: ' . $usercred['email']);
        //         return back()->withInput()->withErrors(['error' => 'Invalid email or password.']);
        //         //return back()-> with('error');
        //     } 
        // }

        public function authlogina(Request $request)
        {
            // Validate the request data
            $request->validate([
                'email' => 'required|email',
                'password' => 'required'
            ]);
    
            $credentials = $request->only('email', 'password');
            Log::info('Attempting authentication for email: ' . $credentials['email']);
            // Attempt to authenticate the user
            if (Auth::attempt($credentials)) {
                // Authentication successful, log and redirect
                Log::info('Authentication successful for email: ' . $credentials['email']);
                $route = $this->redirectDash();
                Log::info('Redirect route: ' . $route);
                
                return redirect($route);
            } else {
                // Authentication failed, log and redirect back with error
                Log::warning('Authentication failed for email: ' . $credentials['email']);
                dd(session()->all());
                return back()->withInput()->withErrors(['error' => 'Invalid email or password.']);
            }
        }
    public function root(){
        if (auth::user() )
        $route = $this->redirectDash();
        return redirect($route);
    }
    // public function redirectDash(){
    //     $redirect = '';
    //     if(Auth::user() && Auth::user()->role == 'Doctor'){
    //         $redirect = '/doctor/view';
    //     }
    //     else if(Auth::user() && Auth::user()->role == 'Nurse'){
    //         $redirect = '/nurse/view';
    //     }
    //     else if (Auth::user() && Auth::user()->role == 'Patient'){
    //         $redirect = '/patient/view';
    //     }
    //      return $redirect;
    //}
    public function redirectDash()
    {
        $redirect = '';
        if (Auth::user()) {
            switch (Auth::user()->role) {
                case 'Doctor':
                    $redirect = '/doctor/view';
                    break;
                case 'Nurse':
                    $redirect = '/nurse/view';
                    break;
                case 'Patient':
                    $redirect = '/patient/view';
                    break;
                default:
                    // Handle default redirection
                    break;
            }
        }
        return $redirect;
       
    }
    

}
