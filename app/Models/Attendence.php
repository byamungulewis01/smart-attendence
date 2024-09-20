<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendence extends Model
{
    use HasFactory;
    protected $fillable = [
        'date',
        'student_id',
        'course_id',
        'status',
    ];
    public function student()
    {
        return $this->belongsTo(Student::class,);
    }
}
