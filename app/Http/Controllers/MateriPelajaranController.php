<?php

namespace App\Http\Controllers;

use App\Guru;
use App\Kelas;
use App\Mapel;
use App\MateriPelajaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class MateriPelajaranController extends Controller
{
    /**
     * Menampilkan daftar materi pelajaran.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        $guru = Guru::where('id_card', Auth::user()->id_card)->first();
        $guruId = $guru->id;
        $materi = MateriPelajaran::with(['mapel.guru', 'kelas'])
            ->whereHas('mapel.guru', function ($query) use ($guruId) {
                $query->where('id', $guruId);
            })
            ->get();

        $mapel = Mapel::all();
        $kelas = Kelas::all();

        return view('guru.materi_pelajaran.index', compact('materi', 'mapel', 'kelas'));
    }

    /**
     * Menyimpan materi pelajaran baru.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        // Validasi input
        $request->validate([
            'judul' => 'required|string|max:255',
            'file_materi' => 'required|file|mimes:pdf,docx,pptx|max:8192', // 8MB max
            'id_mapel' => 'required',
            'id_kelas' => 'required',
        ]);

        // Mengupload file
        if ($request->hasFile('file_materi')) {
            $file = $request->file('file_materi');
            $filePath = $file->store('uploads/file_materi', 'public');
        }

        // Membuat MateriPelajaran baru
        $materi = MateriPelajaran::create([
            'judul' => $request->judul,
            'file_materi' => $filePath,
            'id_mapel' => $request->id_mapel,
            'id_kelas' => $request->id_kelas,
        ]);

        return redirect()->route('materi.pelajaran')->with('success', 'Materi pelajaran berhasil disimpan.');
    }

    /**
     * Menampilkan materi pelajaran berdasarkan ID.
     *
     * @param  int  $id
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        $materi = MateriPelajaran::with(['mapel', 'kelas'])->findOrFail($id);
        return view('guru.materi_pelajaran.show', compact('materi'));
    }

    /**
     * Mengupdate materi pelajaran.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        $materi = MateriPelajaran::findOrFail($id);

        // Validasi input
        $request->validate([
            'judul' => 'required|string|max:255',
            'file_materi' => 'nullable|file|mimes:pdf,docx,pptx|max:8192', // 8MB max
            'id_mapel' => 'required',
            'id_kelas' => 'required',
        ]);

        // Mengupdate file materi jika ada
        if ($request->hasFile('file_materi')) {
            // Hapus file lama jika ada
            if (Storage::disk('public')->exists($materi->file_materi)) {
                Storage::disk('public')->delete($materi->file_materi);
            }

            // Upload file baru
            $file = $request->file('file_materi');
            $filePath = $file->store('uploads/file_materi', 'public');
            $materi->file_materi = $filePath;
        }

        // Update data lainnya
        $materi->judul = $request->judul;
        $materi->id_mapel = $request->id_mapel;
        $materi->id_kelas = $request->id_kelas;
        $materi->save();

        return redirect()->route('materi.pelajaran')->with('success', 'Materi pelajaran berhasil diperbarui.');
    }

    /**
     * Menghapus materi pelajaran.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $materi = MateriPelajaran::findOrFail($id);

        // Hapus file materi
        if (Storage::disk('public')->exists($materi->file_materi)) {
            Storage::disk('public')->delete($materi->file_materi);
        }

        $materi->delete();

        return redirect()->route('materi.pelajaran')->with('success', 'Materi pelajaran berhasil dihapus.');
    }
}
