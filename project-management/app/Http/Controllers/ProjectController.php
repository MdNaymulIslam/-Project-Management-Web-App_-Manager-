<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;
use DateTime;

class ProjectController extends Controller
{
    //

    public function projectlist(Request $request)
    {
        $projects = Project::where('userName',$request->userName)->get();

       return $projects;

     // return $request->userName;
    }

    public function getProject(Request $request)
    {
       $project= Project::where('ProjectId',$request->ProjectId)->first();
                   


         return $project;
    }

    public function editproject(Request $request)
    {
       $project= Project::where('ProjectId',$request->ProjectId)
                    ->update(['projectName'=> $request->projectName,'projectDetails'=> $request->projectDetails,'budget'=> $request->budget,'amountSpent'=> $request->amountSpent]);


         return $project;
    }


    public function addproject(Request $request){

        // $this->validate(
        //     $request,
        //     [
        //         'p_name'=>'required',
        //         'p_description'=>'required',
        //         'p_amount'=>'required|numeric',
        //         'p_deadline'=>'required',
        //         'p_image'=> 'required|mimes:JPG,png,jpeg|max:2048'
                
                
        //     ],
        //     [
        //         'p_name.required'=>'Title is required',
        //         'p_description.required'=>'Description is required',
        //         'p_amount.required'=>'Amount number is required',
        //         'p_amount.numeric'=>'Amount have to be numeric value',
        //         'p_deadline.required'=>'Deadline is required',
        //         'p_image.required'=>'Upload the image first'
              
        //     ]
        // );
       
       
        
       
                                
     
        
        $project= new Project();
        
      

        $project->projectName = $request->projectName;
        
        $project->projectDetails = $request->projectDetails;
        $project->budget = $request->budget; 
        $project->amountSpent = "0";
 
        $project->assignDate = new DateTime();;
        $project->deadline = $request->deadline;
        $project->status = "Queued";
        $project->userName= $request->userName;
        $project->save();
        

        return $project;
     }
}
