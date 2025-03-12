<?php

namespace App\Http\Controllers;

use App\TahunPelajaran;
use Illuminate\Http\Request;

class TahunPelajaranController extends Controller
{
    public function index()
    {
        $tahun_pelajaran = TahunPelajaran::all();
        return view('admin.tahun_pelajaran.index', compact('tahun_pelajaran'));
    }

    public function store(request $request)
    {
        $request->validate([
            'tahun'         => 'required',
            'semester'      => 'required',
            'kepala_sekolah' => 'required',
            // 'tanggal_rapor' => 'required',
            'status'        => 'required'
        ]);
        TahunPelajaran::create($request->all());
        return redirect()->route('paket.index')->with('success', 'Berhasil menambahkan tahun pelajaran');
    }
}
