<?php

namespace App\Http\Controllers;

use App\Pengumuman;
use Illuminate\Http\Request;

class PengumumanApiController extends Controller
{
    public function index() {
        $pengumuman=Pengumuman::all();
        return response()->json(['massage'=>'success','data'=>$pengumuman]);
    }
}
