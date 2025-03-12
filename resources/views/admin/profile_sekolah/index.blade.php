@extends('template_backend.home')

@section('heading', 'PROFIL MTSN GUNUNG GALESA PUTRI')
@section('page')
    <li class="breadcrumb-item active">Data Profile Sekolah</li>
@endsection

@section('content')

    <div class="container mt-5">

        <!-- Gambar Profil Sekolah -->
        <div class="row">
            <div class="col-md-12">
                <img src="{{ asset('img/mtsgunungsari.png') }}" alt="Logo Sekolah" class="img-fluid w-100">
            </div>
        </div>

        <!-- Baris dengan 2 Kolom: Penjelasan dan Informasi -->
        <div class="row mt-4">

            <!-- Kolom Kiri: Penjelasan Sekolah -->
            <div class="col-md-6">
                <p style="text-align: justify">
                    MTs Islamiyah Gunung Galesa merupakan madrasah yang berada di bawah naungan yayasan Pondok Pesantren Gunung Galesa Moyo berdiri sejak 17 Ramadhan 1408 H bertepatan pada tanggal 3 Mei 1988 M.
                    Bertujuan untuk memenuhi kebutuhan Tau Tana Samawa yang memegang teguh adat bersendikan syara’, Syara’ bersendikan kitabullah dan sebagai upaya nyata untuk melestarikan nama dan kegiatan Kerajaan Islam Gunung Galesa.
                    Yang berada di bawah naungan Kementerian Agama Republik Indonesia dan memiliki visi:
                    <b>Menjadi hamba Allah yang berilmu, beriman dan beramal shaleh untuk mencapai ridho Allah.</b>
                </p>
                <p style="text-align: justify">
                    MTs Islamiyah Gunung Galesa dipimpin oleh kepala Madrasah yaitu Drs. H.M.Putera, M.Pd. I . Dengan rekomendasi Bupati Sumbawa pada saat itu dibawah pimpinan H. Madelaoe ADT nomor 451.42/10335 tanggal 02 Mei 1988 M. Secara lokasi MTs Gunung Galesa beralamat di Jalan: Pendidikan I/5   Desa  Moyo Mekar Kecamatan Moyo Hilir Kabupaten Sumbawa  Propinsi Nusa Tenggara Barat. SK. Kakanwildepag Prop. NTB  Tanggal 29 Januari 1999 M Nomor : WX / 1.b / 41 / 1999 dengang status Terakreditasi A  ( Unggul ) Nomor sertifikat : 00590/52  / MTs/ 2023. Keputusan Ketua Badan Akreditasi Nasional Pendidikan Anak Usia Dini, Pendidikan Dasar, dan Pendidikan Menengah Nomor: 116/BAN-PDM/SK/2023 tanggal tanggal 28 November 2023. Dalam proses pembelajaran MTs Gunung Galesa  menggunakan kurikulum modifikasi,
                </p>
            </div>

            <!-- Kolom Kanan: Informasi Kontak dan Sekolah -->
            <div class="col-md-6">
                <button class="btn btn-primary mb-2">Kontak</button>
                <table class="table">
                    <tr>
                        <th>Nama Sekolah</th>
                        <td>MTs Islamiyah Gunung Galesa</td>
                    </tr>
                    <tr>
                        <th>Kontak</th>
                        <td>(0370) 123456</td>
                    </tr>
                    <tr>
                        <th>Alamat</th>
                        <td>Jl. Raya Gunung Galesa No. 1, Sumbawa</td>
                    </tr>
                    <tr>
                        <th>NSM</th>
                        <td>1234567890</td>
                    </tr>
                    <tr>
                        <th>NPSM</th>
                        <td>9876543210</td>
                    </tr>
                    <tr>
                        <th>Status</th>
                        <td>Aktif</td>
                    </tr>
                    <tr>
                        <th>Akreditasi</th>
                        <td>A</td>
                    </tr>
                    <tr>
                        <th>Kabupaten/Kota</th>
                        <td>Sumbawa</td>
                    </tr>
                    <tr>
                        <th>Provinsi</th>
                        <td>Nusa Tenggara Barat</td>
                    </tr>
                </table>
            </div>

        </div> <!-- end row -->

    </div> <!-- end container -->

@endsection

@section('script')
    <script>
        // $("#MasterData").addClass("active");
        // $("#liMasterData").addClass("menu-open");
        $("#ProfileSekolah").addClass("active");
    </script>
@endsection
