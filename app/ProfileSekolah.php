<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProfileSekolah extends Model
{
    protected $table = 'profile_sekolah';

    protected $fillable = [
        'nama_sekolah',
        'kontak',
        'alamat',
        'nsm',
        'npsm',
        'status',
        'akreditasi',
        'kabupaten_kota',
        'provinsi',
        'thumbnail',
        'penjelasan',
    ];
}
