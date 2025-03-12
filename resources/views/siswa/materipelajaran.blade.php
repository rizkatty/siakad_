@extends('template_backend.home')
@section('heading', 'Materi Pelajaran')
@section('page')
    <li class="breadcrumb-item active">Materi Pelajaran</li>
@endsection

@section('content')
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">
                    Form Daftar
                </h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                        <tr class="text-center">
                            <th>No</th>
                            <th>Judul</th>
                            <th>File Materi</th>
                            <th>Mata Pelajaran</th>
                            <th>Kelas</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($materi as $result => $data)
                            <tr class="text-center">
                                <td>{{ $loop->iteration }}</td>
                                <td> {{ $data->judul }}</td>
                                <td>
                                    <a href="{{ asset('storage/' . $data->file_materi) }}" target="_blank">Lihat File</a>
                                </td>
                                <td>{{ $data->mapel->nama_mapel }}</td>
                                <td>{{ $data->kelas->nama_kelas }}</td>
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
        $("#MateriPelajaran").addClass("active");
    </script>
@endsection