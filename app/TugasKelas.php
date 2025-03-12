<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TugasKelas extends Model
{
    protected $fillable = ['judul', 'file_soal', 'id_mapel', 'waktu_awal', 'waktu_akhir', 'status'];

    protected $table = 'tugas_kelas';

    public function mapel()
    {
        return $this->belongsTo('App\Mapel', 'id_mapel', 'id');
    }

    public function guru()
    {
        return $this->hasOneThrough('App\Guru', 'App\Mapel', 'id', 'mapel_id', 'id_mapel', 'id');
    }
}
