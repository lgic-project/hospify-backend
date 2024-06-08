<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DoctorModel extends Model
{
    use HasFactory;
    
    protected $table = 'docacc';
    protected $primaryKey = 'dc_id';
    protected $fillable = [
        'fname',
        'lname',
        'address',
        'city',
        'pnm',
        'gender',
        'age',
        'email',
        'password',
        'img1',
        'role',
        'speciality',
        'qual',
        'starttime',
        'endtime',  
        
    ];
    public function appointments() {
        return $this->hasMany(AppointmentModel::class, 'doctor_id');
    }
    public function review() {
        return $this->hasMany(ReviewModel::class, 'doctor_id');
    }
}
