<?php

namespace App\Http\Controllers;
use App\Models\Team;

use Illuminate\Http\Request;

class TeamController extends Controller
{
    //

    public function teamlist()
    {
        $projects = Team::all();

       return $projects;

     // return $request->userName;
    }
}
