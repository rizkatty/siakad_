<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WaliKelas extends Model
{
    protected $fillable = ['id', 'guru_id', 'kelas_id'];

    protected $table = 'wali_kelas';

    // Relasi dengan tabel MateriPelajaran (Mapel)
    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'kelas_id');
    }

    // Relasi dengan tabel Kelas
    public function guru()
    {
        return $this->belongsTo(Guru::class, 'guru_id');
    }
}
