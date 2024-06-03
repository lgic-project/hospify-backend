<?php

namespace App\Http\Controllers;
use App\Models\PatientModel;
use App\Models\AppointmentModel;
use App\Models\DoctorModel;
use Illuminate\Http\Request;

class AppointmentController extends Controller
{
    public function index(){
        return view ('appointment.index');
    }
    public function form()
    {
      return view ('appointment.scform');
    }


    public function search(){
        $doctor = DoctorModel::all();
        //$url=url('/patient/update/')."/".$id;
        $data = compact('doctor');
       return view('appointment.scform')->with( $data);
    }

 public function save(Request $request){
    $appt = new AppointmentModel;
    $appt->apt =$request['apt'];
    $appt->dc_id =$request['dc_id'];
    $appt->pa_id =$request['pa_id'];
    $appt->save();
    return ('successfull');
 }
 public function view(){
   //  $appt = AppointmentModel::all();
   //  $data = compact('appt','doc','pa');
   //  return view('appointment.appt-view')->with($data);
   $appt = AppointmentModel::with(['doctor', 'patient'])->get();
   return view('appointment.appt-view', compact('appt'));
 }
}
