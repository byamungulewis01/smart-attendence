<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $search = request('search');
        $users = User::when($search, function ($query) use ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', '%' . $search . '%')
                  ->orWhere('email', 'like', '%' . $search . '%')
                  ->orWhere('phone', 'like', '%' . $search . '%');
            });
        })
        ->where('role', 'teacher') // Add this line to filter by role
        ->orderByDesc('id')
        ->paginate(10)
        ->withQueryString();

        return Inertia::render('Teachers', compact('users', 'search'));
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
            'name' => 'required|string|min:4',
            'email' => 'required|email|unique:users,email',
            'phone' => 'required|unique:users,phone',
        ]);

        $request->merge(['password' => 'password', 'role' => 'teacher']);

        try {
            User::create($request->all());
            return back()->with('message', 'Teacher created successfully');
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $teacher)
    {
        $request->validate([
            'name' => 'required|string|min:4',
            'email' => 'required|email|unique:users,email,' . $teacher->id,
            'phone' => 'required|unique:users,phone,' . $teacher->id,
        ]);

        try {
            $teacher->update($request->all());
            return back()->with('message', 'Teacher updated successfully');
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $teacher)
    {
        try {
            $teacher->delete();
            return back()->with('message', 'Teacher deleted successfully');
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('warning', 'Something went wrong, please try again');
        }
    }
}
