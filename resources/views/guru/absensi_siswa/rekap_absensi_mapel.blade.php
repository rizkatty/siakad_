@extends('template_backend.home')
@section('heading', 'Rekap Absen Mapel Siswa')
@section('page')
    <li class="breadcrumb-item active">Rekap Absen Mapel Siswa</li>
@endsection
@section('content')
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Rekap Absensi Mapel</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="rekap_mapel" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Mapel</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($mapel as $key => $data)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>
                                    <a href="{{ route('rekap_absensi_siswa',['kelas_id' => $kelas_id]) }}">
                                        {{ $data->nama_mapel }}
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
            $('#rekap_mapel').DataTable();
        });

        $("#RekapAbsensi").addClass("active");
    </script>
@endsection
