<?php

namespace App\Http\Controllers;

use App\Guru;
use App\Kelas;
use App\WaliKelas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
            'kelas_id' => 'required|exists:kelas,id',
            'guru_id' => 'required|exists:guru,id',
        ]);

        DB::beginTransaction();

        try {
            WaliKelas::create([
                'kelas_id' => $request->kelas_id,
                'guru_id' => $request->guru_id,
            ]);

            $kelas = Kelas::findOrFail($request->kelas_id);
            $kelas->update([
                'guru_id' => $request->guru_id,
            ]);


            DB::commit();

            return redirect()->back()->with('success', 'Data wali kelas berhasil disimpan!');
        } catch (\Exception $e) {
            DB::rollBack();

            return redirect()->back()->with('error', 'Terjadi kesalahan saat menyimpan data: ' . $e->getMessage());
        }
    }


    public function update(Request $request, $id)
    {
        // Validasi input
        $request->validate([
            'kelas_id' => 'required|exists:kelas,id',
            'guru_id' => 'required|exists:guru,id',
        ]);

        DB::beginTransaction();

        try {
            $walikelas = WaliKelas::findOrFail($id);
            $walikelas->update([
                'kelas_id' => $request->kelas_id,
                'guru_id' => $request->guru_id,
            ]);

            $kelas = Kelas::findOrFail($request->kelas_id);
            $kelas->update([
                'guru_id' => $request->guru_id,
            ]);

            DB::commit();

            return redirect()->route('walikelas.list')->with('success', 'Data Wali Kelas berhasil diubah.');
        } catch (\Exception $e) {
            DB::rollBack();

            return redirect()->back()->with('error', 'Terjadi kesalahan saat mengubah data: ' . $e->getMessage());
        }
    }


    public function destroy($id)
    {
        DB::beginTransaction();

        try {
            // Temukan data wali_kelas berdasarkan ID
            $walikelas = WaliKelas::findOrFail($id);
            $kelas = Kelas::findOrFail($walikelas->kelas_id);

            // Set kolom guru_id pada tabel kelas menjadi null
            $kelas->update([
                'guru_id' => null,
            ]);

            // Hapus data wali_kelas
            $walikelas->delete();

            DB::commit();

            // Redirect dengan pesan sukses
            return redirect()->route('walikelas.list')->with('success', 'Data Wali Kelas berhasil dihapus.');
        } catch (\Exception $e) {
            DB::rollBack();

            return redirect()->back()->with('error', 'Terjadi kesalahan saat menghapus data: ' . $e->getMessage());
        }
    }
}
