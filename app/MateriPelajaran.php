<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MateriPelajaran extends Model
{
    protected $fillable = ['judul', 'file_materi', 'id_mapel', 'id_kelas'];

    protected $table = 'materi_pelajaran';

    // Relasi dengan tabel MateriPelajaran (Mapel)
    public function mapel()
    {
        return $this->belongsTo(Mapel::class, 'id_mapel');
    }

    // Relasi dengan tabel Kelas
    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'id_kelas');
    }

    public function guru()
    {
        return $this->hasOneThrough('App\Guru', 'App\Mapel', 'id', 'mapel_id', 'id_mapel', 'id');
    }
}
