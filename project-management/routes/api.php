<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\TeamController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/viewprofile/{userName}',[UserController::class,'viewprofile']);
Route::post('/login',[UserController::class,'loginSubmit']);
Route::post('/changeprofile',[UserController::class,'changeprofileSubmit']);

Route::get('/projectlist/{userName}',[ProjectController::class,'projectlist'])->middleware('APIAuth');
Route::get('/teamlist',[TeamController::class,'teamlist'])->middleware('APIAuth');
Route::get('/developer',[UserController::class,'developer'])->middleware('APIAuth');
Route::get('/tasklist',[TaskController::class,'tasklist'])->middleware('APIAuth');
Route::get('/gettask/{id}',[TaskController::class,'gettask'])->middleware('APIAuth');
Route::post('/edittask',[TaskController::class,'edittask'])->middleware('APIAuth');
Route::get('/getproject/{ProjectId}',[ProjectController::class,'getproject'])->middleware('APIAuth');

Route::post('/editproject',[ProjectController::class,'editproject'])->middleware('APIAuth');
Route::post('/addproject',[ProjectController::class,'addproject'])->middleware('APIAuth');
Route::get('/logout',[UserController::class,'logout']);