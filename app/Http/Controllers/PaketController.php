<?php

namespace App\Http\Controllers;

use App\Paket;
use Illuminate\Http\Request;

class PaketController extends Controller
{
    public function index()
    {
        $paket = Paket::all();
        return view('admin.paket.index', compact('paket'));
    }

    public function create()
    {

    }

    public function store(Request $request)
    {
        $request->validate([
            'ket' => 'required|max:50',
        ]);

        Paket::create($request->all());
        return redirect()->route('paket.index')->with('success', 'Paket berhasil ditambahkan.');
    }

    public function edit($id)
    {
        $paket = Paket::findOrFail($id);
        return view('admin.paket.edit', compact('paket'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'ket' => 'required|max:50',
        ]);

        $paket = Paket::findOrFail($id);
        $paket->update($request->all());
        return redirect()->route('paket.index')->with('success', 'Paket berhasil diperbarui.');
    }

    public function destroy($id)
    {
        $paket = Paket::findOrFail($id);
        $paket->delete(); // Hapus data
        return redirect()->route('paket.index')->with('success', 'Paket berhasil dihapus.');
    }
}
