<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use App\Models\Course;
use Illuminate\Http\Request;

class CoursesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = request('search');

        $courses = $request->user()->role == 'teacher'
            ? Course::with('user')->when($search, function ($query) use ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', '%' . $search . '%')
                        ->orWhere('option', 'like', '%' . $search . '%')
                        ->orWhere('level', 'like', '%' . $search . '%');
                });
            })->where('user_id', $request->user()->id)
            ->orderByDesc('id')
            ->paginate(10)
            ->withQueryString()
            : Course::with('user')->when($search, function ($query) use ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', '%' . $search . '%')
                        ->orWhere('option', 'like', '%' . $search . '%')
                        ->orWhere('level', 'like', '%' . $search . '%');
                });
            })
            ->orderByDesc('id')
            ->paginate(10)
            ->withQueryString();



        $teachers = User::where('role', 'teacher') // Add this line to filter by role
            ->orderByDesc('id')->get();

        return Inertia::render('Courses', compact('courses', 'teachers', 'search'));
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
            'name' => 'required',
            'option' => 'required',
            'level' => 'required',
            'user_id' => 'required'
        ]);

        $request->merge(['status' => $request->status]);

        try {
            Course::create($request->all());
            return back()->with('message', 'Course created successfully');
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Course $course)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Course $course)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Course $course)
    {
        $request->validate([
            'name' => 'required',
            'option' => 'required',
            'level' => 'required',
            'user_id' => 'required'
        ]);

        $request->merge(['status' => $request->status]);

        try {
            $course->update($request->all());
            return back()->with('message', 'Course update successfully');
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Course $course)
    {
        try {
            $course->delete();
            return back()->with('message', 'Course deleted successfully');
        } catch (\Throwable $th) {
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }
}
