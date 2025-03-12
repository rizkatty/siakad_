@extends('template_backend.home')
@section('heading', 'Tugas Kelas')
@section('page')
    <li class="breadcrumb-item active">Tugas Kelas</li>
@endsection
@section('content')
<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <button class="btn btn-primary" data-toggle="modal" data-target=".tambah-tugas">
                <i class="fas fa-book-open"></i>
                Tambah Tugas Kelas
            </button>
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
                                    <button class="btn btn-primary">Edit</button>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-md tambah-tugas">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Kelas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <form action="{{ route('tugas_kelas.store') }}" method="post" enctype="multipart/form-data">
                @csrf
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="judul">Judul</label>
                            <input type="text" name="judul" id="judul" class="form-control  @error('judul') is-invalid @enderror" placeholder="{{ __('judul') }}">
                        </div>
                        <div class="form-group">
                            <label for="file_soal">File Soal</label>
                            <input type="file" name="file_soal" id="file_soal" class="form-control @error('file_soal') is-invalid @enderror" placeholder="{{ __('file_soal') }}">
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
                            <label for="waktu_awal">Waktu Awal</label>
                            <input type="datetime-local" name="waktu_awal" id="waktu_awal" class="form-control  @error('waktu_awal') is-invalid @enderror" placeholder="{{ __('waktu_awal') }}">
                        </div>
                        <div class="form-group">
                            <label for="waktu_akhir">Waktu Akhir</label>
                            <input type="datetime-local" name="waktu_akhir" id="waktu_akhir" class="form-control @error('waktu_akhir') is-invalid @enderror" placeholder="{{ __('waktu_akhir') }}">
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select name="status" id="status" class="form-control @error('status') is-invalid @enderror" placeholder="{{ __('status') }}">
                                <option selected disabled>Pilih Status</option>
                                <option value="Aktif">Aktif</option>
                                <option value="Tidak Aktif">Tidak Aktif</option>
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

@endsection
@section('script')
    <script>
        $("#TugasKelas").addClass("active");
    </script>
@endsection