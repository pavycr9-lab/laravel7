<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        return 'Users page';
    }
    public function getIndex(){
$data=['a' =>'pavly', 'b' =>'pav'];
        return view('welcome',compact('data')) ->with('data',$data);
    }
}
