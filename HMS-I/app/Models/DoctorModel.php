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
        'img1'
        
    ];
}
