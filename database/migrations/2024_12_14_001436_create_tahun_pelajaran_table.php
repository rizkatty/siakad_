<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTahunPelajaranTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tahun_pelajaran', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('tahun'); // Menambahkan field tahun
            $table->string('status'); // Menambahkan field status
            $table->string('semester'); // Menambahkan field semester
            $table->string('kepala_sekolah'); // Menambahkan field kepala_sekolah
            $table->date('tanggal_rapor'); // Menambahkan field tanggal_rapor
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tahun_pelajaran');
    }
}
