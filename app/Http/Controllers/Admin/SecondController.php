<?php

namespace app\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

class secondController extends Controller
{
    public function showString(){
        return 'static string';
    }
}
