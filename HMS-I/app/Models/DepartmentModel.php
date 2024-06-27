<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DepartmentModel extends Model
{
    use HasFactory;
    protected $table = 'departmenttyp';
    protected $primaryKey = 'dpt_id';
    protected $fillable = [
      'dpt_name',
      'dpt_des',
      'dc_id',
        
    ];
    
    public function doctor() {
      return $this->belongsTo(DoctorModel::class, 'dc_id');
  }

  public function patient() {
      return $this->belongsTo(PatientModel::class, 'pa_id');
  }
}
