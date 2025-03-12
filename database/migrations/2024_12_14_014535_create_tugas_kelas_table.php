<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTugasKelasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tugas_kelas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('judul');
            $table->string('file_soal');
            $table->integer('id_mapel');
            $table->dateTime('waktu_awal');
            $table->dateTime('waktu_akhir');
            $table->string('status');
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
        Schema::dropIfExists('tugas_kelas');
    }
}
