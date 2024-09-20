<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use App\Models\Course;
use App\Models\Student;
use App\Models\Attendence;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttendenceController extends Controller
{
    //
    public function options(Request $request)
    {
        $options = $request->user()->role == 'teacher'
            ? Course::where('user_id', $request->user()->id)->select('option')->groupBy('option')->get()
            : Course::select('option')->groupBy('option')->get();

        return response()->json($options);
    }
    public function options_list()
    {
        $search = request('search');
        $option = request('option');
        $courses = Course::with('user')->when($search, function ($query) use ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', '%' . $search . '%')
                    ->orWhere('level', 'like', '%' . $search . '%');
            });
        })->where('option', $option)
            ->orderByDesc('id')
            ->paginate(10)
            ->withQueryString();

        return Inertia::render('Attendence/Index', compact('courses', 'search', 'option'));
    }
    public function attendences(Course $course)
    {

        $attendances = DB::table('attendences')
            ->join('students', 'attendences.student_id', '=', 'students.id')
            ->select(DB::raw("CONCAT(students.fname, ' ', students.lname) as student_name"), 'students.reg_number', 'attendences.course_id', 'attendences.date', 'attendences.status')
            ->where('attendences.course_id', $course->id)
            ->orderBy('attendences.date', 'asc')
            ->get()
            ->groupBy('date');

        $date = now()->format('Y-m-d');
        $isAttendanceDone = (bool) Attendence::whereDate('date', $date)
        ->where('course_id', $course->id)
        ->first();


        return Inertia::render('Attendence/Students', compact('course', 'attendances','isAttendanceDone'));
    }
    public function new_attendences(Course $course)
    {
        $date = now()->format('Y-m-d');
        $attendences = Attendence::with('student')->whereDate('date', $date)->where('course_id', $course->id)->orderByDesc('id')->get();
        return Inertia::render('Attendence/NewAttendence', compact('course', 'attendences'));
    }
    public function store_attendence(Request $request, $card_number)
    {
        $date = now()->format('Y-m-d');
        // Fetch student and course data
        $student = Student::where('card_number', $card_number)->first();
        if (!$student) {
            return response()->json(['error' => 'Student not found'], 404);
        }

        $course = Course::find($request->course);
        if (!$course) {
            return response()->json(['error' => 'Course not found'], 404);
        }

        // Check if student's level and option match the course
        if ($student->level !== $course->level || $student->option !== $course->option) {
            return response()->json(['error' => 'Student is not enrolled in this course'], 403);
        }

        // Check if attendance already exists for this student on the same date and course
        $attendanceExists = Attendence::whereDate('date', $date)
            ->where('student_id', $student->id)
            ->where('course_id', $course->id)
            ->exists();

        // Create attendance record if it doesn't already exist
        if (!$attendanceExists) {
            Attendence::create([
                'date' => $date,
                'student_id' => $student->id,
                'course_id' => $course->id,
                'status' => 'present',
            ]);
        }

        // Fetch attendance records for the current date
        $attendances = Attendence::with('student')
            ->whereDate('date', $date)
            ->orderByDesc('id')
            ->get();

        // Return attendance records
        return response()->json($attendances);
    }
    public function submit_attendence(Course $course)
    {
        $date = now()->format('Y-m-d');

        $attende = Attendence::whereDate('date', $date)->where('course_id', $course->id)->pluck('student_id')->toArray();

        $students = Student::whereNotIn('id', $attende)->where('option', $course->option)->where('level', $course->level)->select('id')->get();
        foreach ($students as $student) {
            Attendence::create([
                'date' => $date,
                'student_id' => $student->id,
                'course_id' => $course->id,
                'status' => 'absent',
            ]);
        }
        return to_route('attendences', $course->id)->with('message', $date . 'Attendence collected');
    }
}
