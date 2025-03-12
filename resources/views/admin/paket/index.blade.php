@extends('template_backend.home')
@section('heading', 'Data Paket')
@section('page')
    <li class="breadcrumb-item active">Data Paket</li>
@endsection
@section('content')
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target=".tambah-paket">
                        <i class="nav-icon fas fa-folder-plus"></i> &nbsp; Tambah Data Paket
                    </button>
                </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th>Nama Paket</th>
                        <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($paket as $result => $data)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $data->ket }}</td>
                            <td>
                                <button type="button" class="btn btn-success btn-sm btn-edit"
                                        data-id="{{ $data->id }}"
                                        data-ket="{{ $data->ket }}">
                                    <i class="nav-icon fas fa-edit"></i> &nbsp; Edit
                                </button>
                                <button type="button" class="btn btn-danger btn-sm btn-delete"
                                        data-id="{{ $data->id }}">
                                    <i class="nav-icon fas fa-trash-alt"></i> &nbsp; Hapus
                                </button>
                            </td>

                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.col -->

    <!-- Modal Tambah -->
    <div class="modal fade bd-example-modal-md tambah-paket" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Tambah Data Paket</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('paket.store') }}" method="post">
                    @csrf
                    <div class="modal-body">
                            <div class="form-group">
                                <label for="ket">Nama Paket</label>
                                <input type="text" id="ket" name="ket" class="form-control @error('ket') is-invalid @enderror" placeholder="Masukkan Nama Paket">
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

    <!-- Modal Edit -->
    <div class="modal fade bd-example-modal-md edit-paket" tabindex="-1" role="dialog" aria-labelledby="editPaketModal" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Data Paket</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="editPaketForm" method="post">
                    @csrf
                    @method('PUT')
                    <div class="modal-body">
                            <div class="form-group">
                                <label for="edit_ket">Nama Paket</label>
                                <input type="text" id="edit_ket" name="ket" class="form-control @error('ket') is-invalid @enderror" placeholder="Masukkan Nama Paket">
                            </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class='nav-icon fas fa-arrow-left'></i> &nbsp; Kembali</button>
                        <button type="submit" class="btn btn-primary"><i class="nav-icon fas fa-save"></i> &nbsp; Simpan Perubahan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Konfirmasi Hapus -->
    <div class="modal fade bd-example-modal-md delete-paket" tabindex="-1" role="dialog" aria-labelledby="deletePaketModal" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Konfirmasi Hapus</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Apakah Anda yakin ingin menghapus data ini?</p>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class='nav-icon fas fa-arrow-left'></i> &nbsp; Batal</button>
                    <form id="deletePaketForm" method="post">
                        @csrf
                        @method('DELETE') <!-- Method DELETE untuk hapus -->
                        <button type="submit" class="btn btn-danger"><i class="nav-icon fas fa-trash-alt"></i> &nbsp; Hapus</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


@endsection
@section('script')

    <script>
        $(document).ready(function () {
            // Trigger modal edit dengan data
            $('.btn-edit').click(function () {
                var id = $(this).data('id'); // Ambil ID dari tombol
                var ket = $(this).data('ket'); // Ambil data Nama Paket

                // Isi form dalam modal edit
                $('#editPaketForm').attr('action', '/paket/' + id); // Atur URL action untuk update
                $('#edit_ket').val(ket); // Isi input dengan data nama paket

                // Tampilkan modal edit
                $('.edit-paket').modal('show');
            });

            // Trigger modal delete dengan data
            $('.btn-delete').click(function () {
                var id = $(this).data('id'); // Ambil ID dari tombol

                // Isi form dalam modal delete
                $('#deletePaketForm').attr('action', '/paket/' + id); // Atur URL action untuk delete

                // Tampilkan modal delete
                $('.delete-paket').modal('show');
            });
        });
    </script>

    <script>
        $("#MasterData").addClass("active");
        $("#liMasterData").addClass("menu-open");
        $("#DataPaket").addClass("active");
    </script>
@endsection
