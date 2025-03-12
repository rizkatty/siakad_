@extends('template_backend.home')
@section('heading', 'Absen Harian Siswa')
@section('page')
    <li class="breadcrumb-item active">Absen Siswa</li>
@endsection
@section('content')

    <style>
        .btn-group-toggle .btn.active {
            background-color: #000 !important;
            color: #fff !important;
            border-color: #000 !important;
            box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.5);
        }
    </style>

    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Input Absen</h3>
            </div>
            <div class="card-body">
                <form action="{{ route('store.absensi', ['mapel_id' => $mapel_id]) }}" method="POST">
                    @csrf
                    <input type="hidden" name="tanggal" value="{{ date('Y-m-d') }}">

                    <div class="table-responsive">
                        <table id="dataTable" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th>NIS</th>
                                <th>Nama Siswa</th>
                                <th>Keterangan</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($siswa as $key => $data)
                                <tr>
                                    <td>{{ $key + 1 }}</td>
                                    <td>{{ $data->nis }}</td>
                                    <td>{{ $data->nama_siswa }}</td>
                                    <td>
                                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                            <label class="btn btn-success">
                                                <input type="radio" name="kehadiran[{{ $data->id }}]" value="1" autocomplete="off"> Hadir
                                            </label>
                                            <label class="btn btn-warning">
                                                <input type="radio" name="kehadiran[{{ $data->id }}]" value="2" autocomplete="off"> Izin
                                            </label>
                                            <label class="btn btn-danger">
                                                <input type="radio" name="kehadiran[{{ $data->id }}]" value="6" autocomplete="off"> Alpa
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </form>
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
