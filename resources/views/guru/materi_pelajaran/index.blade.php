@extends('template_backend.home')
@section('heading', 'Materi Pelajaran')
@section('page')
    <li class="breadcrumb-item active">Daftar Materi Pelajaran</li>
@endsection
@section('content')
<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <button class="btn btn-primary" data-toggle="modal" data-target=".tambah-materi">
                <i class="fas fa-book"></i>
                Tambah Materi Pelajaran
            </button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr class="text-center">
                        <th>No</th>
                        <th>Judul</th>
                        <th>File Materi</th>
                        <th>Mata Pelajaran</th>
                        <th>Kelas</th>
                        <th>Aksi</th>
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
                            <td>
                                <button class="btn btn-primary btn-sm">
                                    Edit
                                </button>
                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target=".hapus_materi">
                                    Hapus
                                </button>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-md tambah-materi">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Materi Pelajaran</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <form action="{{ route('materi_pelajaran.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="judul">Judul</label>
                                <input type="text" name="judul" id="judul" class="form-control  @error('judul') is-invalid @enderror" placeholder="{{ __('judul') }}">
                            </div>
                            <div class="form-group">
                                <label for="file_materi">File Soal</label>
                                <input type="file" name="file_materi" id="file_materi" class="form-control @error('file_materi') is-invalid @enderror" placeholder="{{ __('file_materi') }}">
                            </div>
                            <div class="form-group">
                                <label for="id_mapel">Mata Pelajaran</label>
                                <select name="id_mapel" id="id_mapel" class="form-control @error('id_mapel') is-invalid @enderror" placeholder="{{ __('id_mapel') }}">
                                    <option selected disabled>Pilih Mata Pelajaran</option>
                                    @foreach($mapel as $result => $data_mapel)
                                        <option value="<?= $data_mapel->id ?>"><?= $data_mapel->nama_mapel ?></option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="id_kelas">Kelas</label>
                                <select name="id_kelas" id="id_kelas" class="form-control @error('id_kelas') is-invalid @enderror" placeholder="{{ __('id_kelas') }}">
                                    <option selected disabled>Pilih Kelas</option>
                                    @foreach($kelas as $result => $data_kelas)
                                        <option value="<?= $data_kelas->id ?>"><?= $data_kelas->nama_kelas ?></option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class='nav-icon fas fa-arrow-left'></i> &nbsp; Kembali</button>
                    <button type="submit" class="btn btn-primary"><i class="nav-icon fas fa-save"></i> &nbsp; Tambahkan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-md hapus_materi">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Hapus Materi Pelajaran</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <form action="{{ route('materi_pelajaran.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <span>Apakah anda yakin ingin menghapus data ini?</span>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class='nav-icon fas fa-arrow-left'></i> &nbsp; Kembali</button>
                    <button type="submit" class="btn btn-primary"><i class="nav-icon fas fa-save"></i> &nbsp; Tambahkan</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
@section('script')
    <script>
        $("#MateriPelajaran").addClass("active");
    </script>
@endsection