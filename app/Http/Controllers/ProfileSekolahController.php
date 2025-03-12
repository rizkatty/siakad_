<?php

/**
 * Controller untuk profile sekolah Metode CRUD
 * @author Rizky Adi Ryanto
 * @link github.com/rizkyadiryanto14
 *
 */

namespace App\Http\Controllers;

use App\ProfileSekolah;
use Illuminate\Http\Request;

class ProfileSekolahController extends Controller
{
    public function index()
    {
        $profiles = ProfileSekolah::all();
        return view('admin.profile_sekolah.index', compact('profiles'));
    }

    public function create()
    {
        return view('profile_sekolah.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_sekolah'      => 'required|string|max:255',
            'kontak'            => 'required|string',
            'alamat'            => 'required|string',
            'nsm'               => 'required|string',
            'npsm'              => 'required|string',
            'status'            => 'required|string',
            'akreditasi'        => 'required|string',
            'kabupaten_kota'    => 'required|string',
            'provinsi'          => 'required|string',
            'thumbnail'         => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'penjelasan'        => 'nullable|string',
        ]);

        $data = $request->only([
            'nama_sekolah', 'kontak', 'alamat', 'nsm', 'npsm',
            'status', 'akreditasi', 'kabupaten_kota', 'provinsi', 'penjelasan'
        ]);

        if ($request->hasFile('thumbnail')) {
            $path = $request->file('thumbnail')->store('thumbnails', 'public');
            $data['thumbnail'] = $path;
        }

        ProfileSekolah::create($data);

        return redirect()->route('profile_sekolah.index')->with('success', 'Profile Sekolah berhasil ditambahkan.');
    }

    public function show($id)
    {
        $profile = ProfileSekolah::findOrFail($id);
        return view('profile_sekolah.show', compact('profile'));
    }
}
