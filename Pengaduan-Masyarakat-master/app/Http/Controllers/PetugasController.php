<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pengaduan;
use App\User;
class PetugasController extends Controller
{
    public function index()
    {
        $pengaduan=Pengaduan::count();
        $petugas=User::where('level','petugas')->count();
        $masyarakat=User::where('level','masyarakat')->count();
        $done=Pengaduan::where('status', 'selesai')->count();
        return view('petugas.dashboard', compact('pengaduan', 'petugas', 'masyarakat','done'));
    }
}
