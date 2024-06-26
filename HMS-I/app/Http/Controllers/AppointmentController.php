<?php

namespace App\Http\Controllers;
use App\Models\PatientModel;
use App\Models\AppointmentModel;
use App\Models\DoctorModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
class AppointmentController extends Controller
{
    public function index(){
        return view ('appointment.index');
    }
    public function form()
    {
      return view ('appointment.scform');
    }


    public function search(){ //doc id bata garni banauni
    //this done
   $userId = Auth::user()->id;
   $patient = PatientModel::where('id', $userId)->first();
   session(['pid' => $patient->pa_id]);
   //Log::error('Patient record not found for user ID: ' . $userId);

  
        $doctor = DoctorModel::all();
        $starttime = DoctorModel::where('dc_id', 1)->value('starttime');//yo check garni
        $endtime = DoctorModel::where('dc_id', 1)->value('endtime');
        $data = compact('doctor', 'starttime', 'endtime');
     
       return view('appointment.scform')->with( $data);
    }


public function check(Request $request)
{
    $doctorId = $request->input('dc_id');
    $date = $request->input('apt-date'); 
    $formattedDate = date('Y-m-d', strtotime($date));
 

    $bookedSlots = AppointmentModel::where('dc_id', $doctorId)
        ->whereDate('aptdate', $formattedDate)
        ->pluck('apttime')
        ->toArray();

    // Assuming starttime and endtime are in the same model or related model
    $doctor = DoctorModel::find($doctorId);
    $starttime = $doctor->starttime;
    $endtime = $doctor->endtime;

    return response()->json([
        'bookedSlots' => $bookedSlots,
        'starttime' => $starttime,
        'endtime' => $endtime,
    ]);
}



 public function save(Request $request){
    $appt = new AppointmentModel;
    $appt->aptdate =$request['apt_date'];
    $appt->apttime =$request['apt_time'];
    $appt->dc_id =$request['dc_id'];
    $appt->pa_id =$request['pa_id'];
    $appt->save();
    return ('successfull');
 }
 public function view(){
     $id = session()->get('sid');
     Log::info($id);
    //$appt = AppointmentModel::where('dc_id', $id)->get();
    $appt = AppointmentModel::with(['doctor', 'patient'])->where('dc_id', $id)->get();
   // $appt = AppointmentModel::with(['doctor', 'patient'])->get();
   return view('appointment.appt-view', compact('appt'));
 }
 public function see(){
    $apt = AppointmentModel::with(['doctor', 'patient'])->get();
    $data= compact('apt');
    return view('appointment.index', $data);
 }
}
