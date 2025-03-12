@extends('template_backend.home')
@section('heading', 'Absen Harian Siswa')
@section('page')
    <li class="breadcrumb-item active">Absen Siswa</li>
@endsection
@section('content')
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Input Absen</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="dataTable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Kelas</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($kelas as $key => $data)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>
                                    <a href="{{ route('absensi.mapel', ['kelas_id' => $data->id]) }}">
                                        {{ $data->nama_kelas }}
                                    </a>
                                </td>
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

        $("#AbsenSiswa").addClass("active");
    </script>
@endsection
