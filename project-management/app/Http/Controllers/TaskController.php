<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    //

    public function tasklist()
    {
        $tasks = Task::all();

       return $tasks;

     // return $request->userName;
    }

    public function gettask(Request $request)
    {
        $tasks = Task::where('id',$request->id)->first();

       return $tasks;

     // return $request->userName;
    }
    public function edittask(Request $request)
    {
        $tasks = Task::where('id',$request->id)
        ->update(['comment'=> $request->comment,'status'=> $request->status]);;

       return $tasks;

     // return $request->userName;
    }
}
