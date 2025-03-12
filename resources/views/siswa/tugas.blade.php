@extends('template_backend.home')
@section('heading', 'Tugas Kelas')
@section('page')
    <li class="breadcrumb-item active">Tugas Kelas</li>
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
                            <th>File Soal</th>
                            <th>Mata Pelajaran</th>
                            <th>Waktu Awal</th>
                            <th>Waktu Akhir</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($tugasKelas as $result => $data)
                            <tr class="text-center">
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $data->judul }}</td>
                                <td>
                                    <a href="{{ asset('storage/' . $data->file_soal) }}" target="_blank">Lihat File</a>
                                </td>
                                <td>{{ $data->mapel->nama_mapel }}</td>
                                <td>{{ $data->waktu_awal }}</td>
                                <td>{{ $data->waktu_akhir }}</td>
                                <td>
                                    @if($data->status == 'aktif')
                                        <button class="btn btn-success btn-sm">Open</button>
                                    @elseif($data->status == 'tidak aktif')
                                    @endif
                                </td>
                                <td>
                                    <button class="btn btn-primary" data-toggle="modal" data-target=".upload-jawaban">Upload</button>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade upload-jawaban">
        <div class="modal-dialog  modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Jawaban</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post" enctype="multipart/form-data" class="dropzone" id="jawabanFileDropzone">
                        @csrf
                        <div class="form-group">
                            <label for="jawaban_file">Jawaban</label>
                            <input type="file" name="jawaban_file" id="jawaban_file" class="form-control">
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class='nav-icon fas fa-arrow-left'></i> &nbsp; Kembali</button>
                    <button type="submit" class="btn btn-primary"><i class="nav-icon fas fa-save"></i> &nbsp; Tambahkan</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        $("#TugasSiswa").addClass("active");
    </script>
@endsection