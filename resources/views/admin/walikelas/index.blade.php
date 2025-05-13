@extends('template_backend.home')
@section('heading', 'Data Wali Kelas')
@section('page')
<li class="breadcrumb-item active">Daftar Wali Kelas</li>
@endsection
@section('content')
<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <button class="btn btn-primary" data-toggle="modal" data-target=".tambah-walikelas">
                <i class="fas fa-book"></i>
                Tambah Wali Kelas
            </button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                        <tr class="text-center">
                            <th>No</th>
                            <th>Kelas</th>
                            <th>Nama Wali Kelas</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($walikelas as $result => $data)
                        <tr class="text-center">
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ optional($data->kelas)->nama_kelas ?? 'Kelas Tidak Diketahui' }}</td>
                            <td>{{ $data->guru->nama_guru }}</td>
                            <td>
                                <button class="btn btn-primary btn-sm"
                                    data-toggle="modal"
                                    data-target="#editModal"
                                    data-id="{{ $data->id }}"
                                    data-kelas="{{ $data->kelas_id }}"
                                    data-guru="{{ $data->guru_id }}">
                                    Edit
                                </button>

                                <button class="btn btn-danger btn-sm"
                                    data-toggle="modal"
                                    data-target="#deleteModal"
                                    data-id="{{ $data->id }}">
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

<div class="modal fade tambah-walikelas">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">
                    <h3>Form Tambah Wali Kelas</h3>
                </div>
            </div>
            <form action="{{ route('walikelas.store') }}" method="post">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label for="kelas_id">Kelas</label>
                        <select name="kelas_id" id="kelas_id" class="form-control" onchange="updateWaliKelas()">
                            <option selected disabled>Pilih Kelas</option>
                            @foreach($kelas as $k)
                            <option value="{{ $k->id }}" data-nama-guru="{{ $k->guru->nama_guru }}" data-guru-id="{{ $k->guru_id }}">{{ $k->nama_kelas }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="guru_id">Guru</label>
                        <select name="guru_id" id="guru_id" class="form-control">
                            <option selected disabled>Pilih Guru</option>
                            @foreach($guru as $result => $data)
                            <option value="{{ $data->id }}">{{ $data->nama_guru }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" type="submit">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade edit-walikelas" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Form Edit Wali Kelas</h3>
            </div>
            <form id="editForm" method="post">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <div class="form-group">
                        <label for="edit_kelas_id">Kelas</label>
                        <select name="kelas_id" id="edit_kelas_id" class="form-control">
                            <option selected disabled>Pilih Kelas</option>
                            @foreach($kelas as $data)
                            <option value="{{ $data->id }}">{{ $data->nama_kelas }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="edit_guru_id">Guru</label>
                        <select name="guru_id" id="edit_guru_id" class="form-control">
                            <option selected disabled>Pilih Guru</option>
                            @foreach($guru as $data)
                            <option value="{{ $data->id }}">{{ $data->nama_guru }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" type="submit">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade hapus-walikelas" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Hapus Wali Kelas</h5>
            </div>
            <form id="deleteForm" method="post">
                @csrf
                @method('DELETE')
                <div class="modal-body">
                    <p>Apakah Anda yakin ingin menghapus data ini?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button class="btn btn-danger" type="submit">Hapus</button>
                </div>
            </form>
        </div>
    </div>
</div>


@endsection
@section('script')

<script>
    function updateWaliKelas() {
        var select = document.getElementById("kelas_id");
        var waliKelasInput = document.getElementById("wali_kelas");
        var guruIdInput = document.getElementById("guru_id");
        var selectedOption = select.options[select.selectedIndex];
        var namaGuru = selectedOption.getAttribute("data-nama-guru");
        var guruId = selectedOption.getAttribute("data-guru-id");

        waliKelasInput.value = namaGuru; // Set nama guru ke input
        guruIdInput.value = guruId; // Set guru_id ke input tersembunyi
    }
</script>
<script>
    $('#editModal').on('show.bs.modal', function(e) {
        let button = $(e.relatedTarget);
        let id = button.data('id');
        let kelasId = button.data('kelas');
        let guruId = button.data('guru');

        // Set form action
        $('#editForm').attr('action', '/walikelas/' + id);

        // Set nilai pada dropdown
        $('#edit_kelas_id').val(kelasId);
        $('#edit_guru_id').val(guruId);
    });

    $('#deleteModal').on('show.bs.modal', function(e) {
        let button = $(e.relatedTarget); // Tombol yang memicu modal
        let id = button.data('id'); // Ambil ID dari tombol

        // Set form action
        $('#deleteForm').attr('action', '/walikelas/' + id);
    });


    $("#DataWaliKelas").addClass("active");
</script>
@endsection