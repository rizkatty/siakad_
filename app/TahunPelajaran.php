<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TahunPelajaran extends Model
{
    protected $fillable = ['tahun', 'semester', 'kepala_sekolah', 'tanggal_rapor', 'status'];

    protected $table = 'tahun_pelajaran';
}
