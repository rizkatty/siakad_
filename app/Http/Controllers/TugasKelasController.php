<?php

namespace App\Http\Controllers;

use App\Guru;
use App\Mapel;
use App\TugasKelas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class TugasKelasController extends Controller
{
    // Menampilkan semua tugas kelas
    public function index()
    {
        $guru = Guru::where('id_card', Auth::user()->id_card)->first();
        $guruId = $guru->id;
        $tugasKelas = TugasKelas::with('mapel.guru')
            ->whereHas('mapel.guru', function ($query) use ($guruId) {
                $query->where('id', $guruId);
            })
            ->get();
        $mapel = Mapel::all();
        return view('guru.tugas_kelas.index', compact('tugasKelas', 'mapel'));
    }

    public function create()
    {
        return view('guru.tugas_kelas.create');
    }

    // Menyimpan tugas kelas baru
    public function store(Request $request)
    {
        // Validasi data
        $validatedData = $request->validate([
            'judul' => 'required|string|max:255',
            'file_soal' => 'required|file|mimes:pdf,docx,doc,jpg,png|max:8192',
            'id_mapel' => 'required|',
            'waktu_awal' => 'required|date',
            'waktu_akhir' => 'required|date|after_or_equal:waktu_awal',
        ]);

        // Menyimpan file
        if ($request->hasFile('file_soal')) {
            $file = $request->file('file_soal');
            $filePath = $file->store('uploads/tugas_kelas', 'public');
        }

        // Menyimpan data tugas kelas ke database
        TugasKelas::create([
            'judul' => $validatedData['judul'],
            'file_soal' => $filePath ?? null,
            'id_mapel' => $validatedData['id_mapel'],
            'waktu_awal' => $validatedData['waktu_awal'],
            'waktu_akhir' => $validatedData['waktu_akhir'],
            'status' => 'aktif',
        ]);

        // Redirect setelah berhasil
        return redirect()->route('tugas_kelas.index')->with('success', 'Tugas kelas berhasil dibuat!');
    }

    // Menampilkan form untuk mengedit tugas kelas
    public function edit($id)
    {
        // gk kepake jadi saya hapus
    }

    // Memperbarui tugas kelas
    public function update(Request $request, $id)
    {
        // Validasi data
        $validatedData = $request->validate([
            'judul' => 'required|string|max:255',
            'file_soal' => 'nullable|file|mimes:pdf,docx,doc,jpg,png|max:8192', // 8MB = 8192KB
            'id_mapel' => 'required|exists:mapel,id',
            'waktu_awal' => 'required|date',
            'waktu_akhir' => 'required|date|after_or_equal:waktu_awal',
        ]);

        $tugasKelas = TugasKelas::findOrFail($id);

        // Menyimpan file baru jika ada
        if ($request->hasFile('file_soal')) {
            $file = $request->file('file_soal');
            // Hapus file lama jika ada
            if ($tugasKelas->file_sekolah) {
                Storage::disk('public')->delete($tugasKelas->file_sekolah);
            }
            // Menyimpan file ke public/uploads/tugas_kelas
            $filePath = $file->store('uploads/tugas_kelas', 'public');
        } else {
            $filePath = $tugasKelas->file_sekolah;
        }

        // Memperbarui data tugas kelas
        $tugasKelas->update([
            'judul' => $validatedData['judul'],
            'file_soal' => $filePath,
            'id_mapel' => $validatedData['id_mapel'],
            'waktu_awal' => $validatedData['waktu_awal'],
            'waktu_akhir' => $validatedData['waktu_akhir'],
            'status' => 'aktif',
        ]);

        // Redirect setelah berhasil
        return redirect()->route('tugas_kelas.index')->with('success', 'Tugas kelas berhasil diperbarui!');
    }

    // Menghapus tugas kelas
    public function destroy($id)
    {
        $tugasKelas = TugasKelas::findOrFail($id);

        // Hapus file soal jika ada
        if ($tugasKelas->file_sekolah) {
            Storage::disk('public')->delete($tugasKelas->file_sekolah);
        }

        // Hapus data tugas kelas
        $tugasKelas->delete();

        // Redirect setelah berhasil
        return redirect()->route('tugas_kelas.index')->with('success', 'Tugas kelas berhasil dihapus!');
    }
}
