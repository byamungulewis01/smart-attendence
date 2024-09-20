<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use App\Models\Student;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $search = request('search');
        $students = Student::when($search, function ($query) use ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('fname', 'like', '%' . $search . '%')
                    ->orWhere('lname', 'like', '%' . $search . '%')
                    ->orWhere('option', 'like', '%' . $search . '%')
                    ->orWhere('level', 'like', '%' . $search . '%')
                    ->orWhere('reg_number', 'like', '%' . $search . '%');
            });
        })
            ->orderByDesc('id')
            ->paginate(10)
            ->withQueryString();

        return Inertia::render('Students', compact('students', 'search'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'fname' => 'required',
            'lname' => 'required',
            'option' => 'required',
            'level' => 'required',
            'card_number' => 'required'
        ]);
        $count = str_pad(Student::max('id') + 1, 5, '0', STR_PAD_LEFT);

        $request->merge(['status' => $request->status, 'reg_number' => date('y') . 'RP' . $count]);
        try {
            Student::create($request->all());
            return back()->with('message', 'Student created successfully');
        } catch (\Throwable $th) {
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Student $student)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Student $student)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Student $student)
    {
        $request->validate([
            'fname' => 'required',
            'lname' => 'required',
            'option' => 'required',
            'level' => 'required',
            'card_number' => 'required'
        ]);

        try {
            $student->update($request->all());
            return back()->with('message', 'Student updated successfully');
        } catch (\Throwable $th) {
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Student $student)
    {
        try {
            $student->delete();
            return back()->with('message', 'Student deleted successfully');
        } catch (\Throwable $th) {
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }
}
