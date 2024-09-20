<?php

use App\Http\Controllers\AttendenceController;
use App\Http\Controllers\CoursesController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\UserController;
use App\Models\Course;
use App\Models\Student;
use App\Models\User;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return to_route('login');
});

Route::get('/dashboard', function () {
    $overview = [
        'users' => User::where('role', 'admin')->count(),
        'teachers' => User::where('role', 'teacher')->count(),
        'courses' => Course::count(),
        'students' => Student::count(),
    ];

    return Inertia::render('Dashboard', compact('overview'));
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('users', UserController::class);
    Route::resource('teachers', TeacherController::class);
    Route::resource('courses', CoursesController::class);
    Route::resource('students', StudentController::class);
    Route::controller(AttendenceController::class)->group(function () {
        Route::get('options', 'options')->name('options');
        Route::get('options-list', 'options_list')->name('options_list');
        Route::get('attendences/{course}', 'attendences')->name('attendences');
        Route::get('attendences-new/{course}', 'new_attendences')->name('new_attendences');
        Route::post('store-attendence/{card_number}','store_attendence')->name('store_attendence');
        Route::post('submit-attendence/{course}','submit_attendence')->name('submit_attendence');
    });
});

require __DIR__ . '/auth.php';
