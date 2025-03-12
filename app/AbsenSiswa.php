<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AbsenSiswa extends Model
{
    // Kolom yang bisa diisi
    protected $fillable = ['siswa_id', 'tanggal', 'kehadiran_id', 'mapel_id'];

    // Relasi ke tabel siswa
    public function siswa()
    {
        return $this->belongsTo('App\Siswa')->withDefault();
    }

    // Relasi ke tabel kehadiran
    public function kehadiran()
    {
        return $this->belongsTo('App\Kehadiran')->withDefault();
    }

    // Relasi ke tabel mata pelajaran
    public function mataPelajaran()
    {
        return $this->belongsTo('App\Mapel', 'mapel_id')->withDefault();
    }

    protected $table = 'absensi_siswa';
}
