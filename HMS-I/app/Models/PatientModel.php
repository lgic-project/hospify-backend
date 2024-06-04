<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientModel extends Model
{
    use HasFactory;
    protected $table = 'patientacc';
    protected $primaryKey = 'pa_id';
    protected $fillable = [
        'fname',
        'lname',
        'address',
        'city',
        'pnm',
        'gender',
        'age',
        'weight',
        'mh',
        'email',
        'password',
        'img1',
        'dis',
        'role',
        
    ];
    public function appointments() {
        return $this->hasMany(AppointmentModel::class, 'patient_id');
    }
}
