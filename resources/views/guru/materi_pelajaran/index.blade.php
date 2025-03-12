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
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal{{ $data->id }}">
                                    Edit
                                </button>
                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target=".hapus_materi">
                                    Hapus
                                </button>
                            </td>
                        </tr>
                        <!-- Edit Modal -->
                        <div class="modal fade" id="editModal{{ $data->id }}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel{{ $data->id }}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel{{ $data->id }}">Edit Materi Pelajaran</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="{{ route('materi_pelajaran.update', $data->id) }}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        @method('PUT')
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="editJudul{{ $data->id }}">Judul</label>
                                                <input type="text" class="form-control" id="editJudul{{ $data->id }}" name="judul" value="{{ $data->judul }}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="editFile{{ $data->id }}">File Materi</label>
                                                <input type="file" class="form-control-file" id="editFile{{ $data->id }}" name="file_materi">
                                            </div>
                                            <div class="form-group">
                                                <label for="editMapel{{ $data->id }}">Mapel</label>
                                                <select class="form-control" id="editMapel{{ $data->id }}" name="id_mapel" required>
                                                    @foreach($mapel as $mapelItem)
                                                    <option value="{{ $mapelItem->id }}" {{ $data->id_mapel == $mapelItem->id ? 'selected' : '' }}>
                                                        {{ $mapelItem->nama_mapel }}
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="editKelas{{ $data->id }}">Kelas</label>
                                                <select class="form-control" id="editKelas{{ $data->id }}" name="id_kelas" required>
                                                    @foreach($kelas as $kelasItem)
                                                    <option value="{{ $kelasItem->id }}" {{ $data->id_kelas == $kelasItem->id ? 'selected' : '' }}>
                                                        {{ $kelasItem->nama_kelas }} <!-- Adjust this to the correct property name -->
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Delete Modal -->
                        <div class="modal fade bd-example-modal-md hapus_materi" id="deleteModal{{ $data->id }}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-md" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Hapus Materi Pelajaran</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="{{ route('materi_pelajaran.destroy', $data->id) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <div class="modal-body">
                                            <p>Apakah Anda yakin ingin menghapus materi pelajaran <strong>{{ $data->judul }}</strong>?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-danger">Hapus</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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


@endsection
@section('script')
<script>
    $("#MateriPelajaran").addClass("active");
</script>
@endsection