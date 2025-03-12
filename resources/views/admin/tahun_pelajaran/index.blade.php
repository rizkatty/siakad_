@extends('template_backend.home')

@section('heading', 'DAFTAR TAHUN PELAJARAN')
@section('page')
<li class="breadcrumb-item active">Data Tahun Pelajaran</li>
@endsection

@section('content')
<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target=".tambah-tahun">
                    <i class="nav-icon fas fa-calendar-alt"></i> Tambah Tahun Pelajaran
                </button>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="tahun_pelajaran" class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr class="text-center">
                        <th>No.</th>
                        <th>Status</th>
                        <th>Tahun</th>
                        <th>Semester</th>
                        <th>Kepala Sekolah</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($tahun_pelajaran as $result => $data)
                        <tr class="text-center">
                            <td>{{  $loop->iteration }}</td>
                            @if($data->status == 1)
                                <td> <button class="btn btn-primary">Aktif</button> </td>
                            @elseif($data->status == 0)
                                <td><button class="btn btn-danger">Tidak Aktif</button></td>
                            @endif
                            <td>{{  $data->tahun }}</td>
                            <td>{{  $data->semester }}</td>
                            <td>{{  $data->kepala_sekolah }}</td>
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

<div class="modal fade bd-example-modal-md tambah-tahun" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Data Tahun Pelajaran</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>

            <form action="{{ route('tahun_pelajaran.store') }}" method="post">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tahun">Tahun Pelajaran</label>
                                <input type="text" name="tahun" id="tahun" class="form-control @error('tahun') is-invalid @enderror" placeholder="{{ __('Nama Tahun Pelajaran') }}">
                            </div>
                            <div class="form-group">
                                <label for="semester">Semester</label>
                                <input type="text" name="semester" id="semester" class="form-control @error('semester') is-invalid @enderror" placeholder="{{ __('Nama Semester') }}">
                            </div>
                            <div class="form-group">
                                <label for="kepala_sekolah">Kepala Sekolah</label>
                                <input type="text" name="kepala_sekolah" id="kepala_sekolah" class="form-control @error('kepala_sekolah') is-invalid @enderror" placeholder="{{ __('Nama Kepala Sekolah') }}">
                            </div>
                            {{-- <div class="form-group">
                                <label for="tanggal_rapor">Tanggal Rapor</label>
                                <input type="date" name="tanggal_rapor" id="tanggal_rapor" class="form-control @error('tanggal_rapor') is-invalid @enderror" placeholder="{{ __('Tanggal Rapor') }}">
                            </div> --}}
                            <div class="form-group">
                                <label for="tanggal_rapor">Tanggal Rapor</label>
                                <select name="status" id="status" class="form-control">
                                    <option selected disabled>Pilih Status</option>
                                    <option value="1">Aktif</option>
                                    <option value="0">Tidak Aktif</option>
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
        // $("#MasterData").addClass("active");
        // $("#liMasterData").addClass("menu-open");
        $("#TahunPelajaran").addClass("active");
    </script>
@endsection