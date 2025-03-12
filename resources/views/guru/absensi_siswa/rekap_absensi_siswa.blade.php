@extends('template_backend.home')
@section('heading', 'Absen Harian Siswa')
@section('page')
    <li class="breadcrumb-item active">Rekap Absen Siswa</li>
@endsection
@section('content')
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Rekap Absen Siswa - {{ $kelas->nama_kelas }}</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="dataTable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>NIS</th>
                            <th>Nama Siswa</th>
                            <th>Hadir</th>
                            <th>Sakit</th>
                            <th>Izin</th>
                            <th>Tanpa Keterangan</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($rekapAbsensi as $index => $rekap)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $rekap['nis'] }}</td>
                                <td>{{ $rekap['nama'] }}</td>
                                <td>{{ $rekap['hadir']}}</td>
                                <td>{{ $rekap['sakit'] }}</td>
                                <td>{{ $rekap['izin'] }}</td>
                                <td>{{ $rekap['tanpa_keterangan'] }}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });

        $("#RekapAbsensi").addClass("active");
    </script>
@endsection
