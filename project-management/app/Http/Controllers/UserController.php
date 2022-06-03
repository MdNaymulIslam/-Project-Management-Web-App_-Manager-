<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use DateTime;
use App\Models\User;
use App\Models\Token;

class UserController extends Controller
{
    //

    public function viewprofile(Request $request)
    {
        $user = User::where('userName',$request->userName)->first();
        return $user;
    }


    public function loginSubmit(Request $request)
    {
        $check= User::where('userName',$request->userName)->first();
                            
         if($check!=null)
         {
             if($request->password== $check->password)
             {
                $api_token= str::random(64);
                $token = new Token();
                $token->userName= $check->userName;
                $token->role=$check->role;
                $token->token= $api_token;
                $token->created_at= new DateTime();
                $token->save();

                return $token;

             }
             return "Wrong Password";
            
         }

        
         
        return "No user found";
    }

    public function changeprofileSubmit(Request $request)
    {
       $user= User::where('userName',$request->userName)
                    ->update(['email'=> $request->email,'education'=> $request->education,'address'=> $request->address,'phone'=> $request->phone,'skills'=>$request->skills]);


         return $user;
    }

    public function developer()
    {
        $user= User::where('role',"developer")->get();

        return $user;
    }

    public function logout(Request $request)
    {
        $token = $request->header("Authorization");

        $user= Token::where('token',$token)
                    ->update(['status'=> 'disable']);

        return "Logout";
    }
}
