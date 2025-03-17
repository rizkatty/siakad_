<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Kelas;
use App\Guru;
use App\Paket;
use App\Jadwal;
use App\Siswa;
use App\WaliKelas;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;

class KelasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $kelas = Kelas::orderByRaw("FIELD(nama_kelas, 'KELAS VIII A', 'KELAS VIII B', 'KELAS VIII C', 'KELAS IX A', 'KELAS IX B', 'KELAS IX C')")->get();
            $guru = Guru::orderByRaw('LOWER(nama_guru) asc')->get();
            $paket = Paket::all();
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while retrieving data.');
        }

        return view('admin.kelas.index', compact('kelas', 'guru', 'paket'));
    }


    public function kelas_guru()
    {
        $guru = Guru::OrderBy('nama_guru', 'asc')->where('id', Auth::user()->id_card)->get();
        dd($guru);
        $kelas = Kelas::OrderBy('nama_kelas', 'asc')->where('guru_id', $guru->id)->first();
        $paket = Paket::all();
        return view('guru.kelas.index', compact('kelas', 'guru', 'paket'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $guru = Guru::OrderBy('nama_guru', 'asc')->get();
        return view('admin.kelas.create', compact('guru'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();

        try {
            if ($request->id != '') {
                $this->validate($request, [
                    'nama_kelas' => 'required|min:4|max:20',
                    'guru_id' => 'required|unique:kelas,guru_id,' . $request->id,
                ]);
            } else {
                $this->validate($request, [
                    'nama_kelas' => 'required|unique:kelas|min:4|max:20',
                    'guru_id' => 'required|unique:kelas',
                ]);
            }

            $kelas = Kelas::updateOrCreate(
                [
                    'id' => $request->id
                ],
                [
                    'nama_kelas' => $request->nama_kelas,
                    'paket_id' => '9',
                    'guru_id' => $request->guru_id,
                ]
            );

            if ($request->has('kelas_id')) {
                WaliKelas::create([
                    'kelas_id' => $request->kelas_id,
                    'guru_id' => $request->guru_id,
                ]);
            } else {
                WaliKelas::create([
                    'kelas_id' => $kelas->id,
                    'guru_id' => $request->guru_id,
                ]);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Data kelas berhasil diperbarui!');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', 'Terjadi kesalahan saat menyimpan data: ' . $e->getMessage());
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $kelas = Kelas::findorfail($id);
        $countJadwal = Jadwal::where('kelas_id', $kelas->id)->count();
        if ($countJadwal >= 1) {
            Jadwal::where('kelas_id', $kelas->id)->delete();
            Kelas::where('id', $kelas->id)->delete();
        } else {
        }
        $countSiswa = Siswa::where('kelas_id', $kelas->id)->count();
        if ($countSiswa >= 1) {
            Siswa::where('kelas_id', $kelas->id)->delete();
            Kelas::where('id', $kelas->id)->delete();
        } else {
            Kelas::where('id', $kelas->id)->delete();
        }
        $kelas->delete();
        return redirect()->back()->with('warning', 'Data kelas berhasil dihapus! (Silahkan cek trash data kelas)');
    }

    public function trash()
    {
        $kelas = Kelas::onlyTrashed()->get();
        return view('admin.kelas.trash', compact('kelas'));
    }

    public function restore($id)
    {
        $id = Crypt::decrypt($id);
        $kelas = Kelas::withTrashed()->findorfail($id);
        $countJadwal = Jadwal::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countJadwal >= 1) {
            Jadwal::withTrashed()->where('kelas_id', $kelas->id)->restore();
        } else {
        }
        $countSiswa = Siswa::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countSiswa >= 1) {
            Siswa::withTrashed()->where('kelas_id', $kelas->id)->restore();
        } else {
        }
        $kelas->restore();
        return redirect()->back()->with('info', 'Data kelas berhasil direstore! (Silahkan cek data kelas)');
    }

    public function kill($id)
    {
        $kelas = Kelas::withTrashed()->findorfail($id);
        $countJadwal = Jadwal::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countJadwal >= 1) {
            Jadwal::withTrashed()->where('kelas_id', $kelas->id)->forceDelete();
        } else {
        }
        $countSiswa = Siswa::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countSiswa >= 1) {
            Siswa::withTrashed()->where('kelas_id', $kelas->id)->forceDelete();
        } else {
        }
        $kelas->forceDelete();
        return redirect()->back()->with('success', 'Data kelas berhasil dihapus secara permanent');
    }

    public function getEdit(Request $request)
    {
        $kelas = Kelas::where('id', $request->id)->get();
        foreach ($kelas as $val) {
            $newForm[] = array(
                'id' => $val->id,
                'nama' => $val->nama_kelas,
                'paket_id' => $val->paket_id,
                'guru_id' => $val->guru_id,
            );
        }
        return response()->json($newForm);
    }
}
