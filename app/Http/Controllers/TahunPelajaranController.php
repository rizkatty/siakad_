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

    public function update(Request $request, $id)
    {
        $request->validate([
            'tahun' => 'required|string|max:255',
            'semester' => 'required|string|max:255',
            'kepala_sekolah' => 'required|string|max:255',
            'status' => 'required|boolean',
        ]);

        $tahunPelajaran = TahunPelajaran::findOrFail($id);
        $tahunPelajaran->tahun = $request->tahun;
        $tahunPelajaran->semester = $request->semester;
        $tahunPelajaran->kepala_sekolah = $request->kepala_sekolah;
        $tahunPelajaran->status = $request->status;
        $tahunPelajaran->save();

        return redirect()->route('tahun.pelajaran')->with('success', 'Data Tahun Pelajaran berhasil diperbarui.');
    }
}
