<?php

namespace App\Http\Controllers\API;
use App\Models\DepartmentModel;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DepartmentControllerApi extends Controller
{
 public  function view(){
    $dpt =  DepartmentModel::all();
    
   $result = array('status'=> true, 'Data'=>$dpt);
   $rescode =200;
    return response()->json($result,$rescode);
 }


}
