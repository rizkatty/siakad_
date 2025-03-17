<?php

namespace App\Http\Controllers;

use App\Guru;
use App\Kelas;
use App\WaliKelas;
use Illuminate\Http\Request;

class WaliKelasController extends Controller
{
    public function index()
    {
        $walikelas = WaliKelas::with('guru', 'kelas')->get();
        $kelas = Kelas::all();
        $guru = Guru::all();
        return view('admin.walikelas.index', compact('walikelas', 'kelas', 'guru'));
    }

    public function store(Request $request)
    {
        // Validasi input
        $request->validate([
            'kelas_id' => 'required',
            'guru_id' => 'required', // Validasi guru_id
        ]);

        // Simpan data wali kelas
        WaliKelas::create([
            'kelas_id' => $request->kelas_id,
            'guru_id' => $request->guru_id,
        ]);

        return redirect()->back()->with('success', 'Data wali kelas berhasil disimpan!');
    }

    public function update(Request $request, $id)
    {
        // Validasi input
        $request->validate([
            'kelas_id' => 'required|exists:kelas,id',
            'guru_id' => 'required|exists:guru,id',
        ]);

        // Update data di tabel wali_kelas
        $walikelas = WaliKelas::findOrFail($id);
        $walikelas->update([
            'kelas_id' => $request->kelas_id,
            'guru_id' => $request->guru_id,
        ]);

        // Redirect dengan pesan sukses
        return redirect()->route('walikelas.list')->with('success', 'Data Wali Kelas berhasil diubah.');
    }

    public function destroy($id)
    {
        // Temukan data wali_kelas berdasarkan ID
        $walikelas = WaliKelas::findOrFail($id);

        // Hapus data dari database
        $walikelas->delete();

        // Redirect dengan pesan sukses
        return redirect()->route('walikelas.list')->with('success', 'Data Wali Kelas berhasil dihapus.');
    }
}
