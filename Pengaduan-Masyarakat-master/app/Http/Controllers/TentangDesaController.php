<?php

namespace App\Http\Controllers;
use App\TentangDesa;

use Illuminate\Http\Request;


class TentangDesaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {   
        $tentangdesas = TentangDesa::latest()->paginate(20);
        return view('admin.tentangdesa.index',compact('tentangdesas'))
                ->with('i',(request()->input('page', 1) -1) *5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.tentangdesa.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       TentangDesa::create([
            'nama' => $request->nama,
            'level' => $request->level,
            'isi' => $request->isi,
            'judul' => $request->judul,
       ]);
       return redirect('admin/tentangdesa')->with('success','data desa berhasil dikirim');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Pengumuman  $pengumuman
     * @return \Illuminate\Http\Response
     */
    public function showing($id){
        $tentangdesa = \App\TentangDesa::find($id);
        return view('admin.tentangdesa.show',compact('tentangdesa'));  
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Pengumuman  $pengumuman
     * @return \Illuminate\Http\Response
     */
    public function edit(TentangDesa $tentangdesa)
    {
        return view('admin.tentangdesa.edit',compact('tentangdesa'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Pengumuman  $pengumuman
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TentangDesa $tentangdesa)
    {
       TentangDesa::whereId($tentangdesa->id)->update([
            'nama' => $request->nama,
            'judul' => $request->judul,
            'isi' => $request->isi,
            'level' => $request->level,
       ]);
        return redirect ('admin/tentangdesa')->with('warning','Data Telah di ubah.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Pengumuman  $pengumuman
     * @return \Illuminate\Http\Response
     */
    public function destroy(TentangDesa $tentangdesa)
    {
        $tentangdesa->delete();
        return back()
                ->with('destroy','1 Tentang Desa Telah Di Hapus.');
    }
}
