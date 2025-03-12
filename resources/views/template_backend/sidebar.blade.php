<style>
    .sidebar-dark-green {
        background-color: #076216 !important;
        color: #fff !important;
    }

    .sidebar-dark-green .nav-link {
        color: #fff !important;
    }

    .sidebar-dark-green .nav-link:hover {
        background-color: rgba(255, 255, 255, 0.1);
        color: #ffA200 !important;
    }

    .sidebar-dark-green .brand-link {
        background-color: #076216 !important;
        color: #fff !important;
        border-bottom: 2px solid
    }

    .brand-link {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding: 10px 0;
    }

    .brand-link .brand-image {
        width: 70px;
        height: 70px;
        margin-bottom: 5px;
    }

    .brand-link .brand-text {
        font-size: 1.2rem;
        font-weight: 600;
        color: #fff !important;
    }

</style>

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-green elevation-4">
    <!-- Brand Logo -->
    <a href="" class="brand-link text-center">
        <img src="{{ asset('img/logo.png') }}" alt="logo_mts" class="brand-image mt-3">
        <span class="brand-text font-weight-light">SIAKAD</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar ">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                @if (Auth::user()->role == 'Admin' || Auth::user()->role == 'Operator')
                    <li class="nav-item has-treeview mt-5" id="liDashboard">
                        <a href="{{ route('admin.home') }}" class="nav-link" id="Dashboard">
                            <i class="nav-icon fas fa-home"></i>
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('profile.sekolah') }}" class="nav-link" id="ProfileSekolah">
                            <i class="fas fa-building nav-icon"></i>
                            <p>Profile Sekolah</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('tahun.pelajaran') }}" class="nav-link" id="TahunPelajaran">
                            <i class="fas fa-house-damage nav-icon"></i>
                            <p>Tahun Pelajaran</p>
                        </a>
                    </li>
                    <li class="nav-item has-treeview" id="liMasterData">
                        <a href="#" class="nav-link" id="MasterData">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                Data Akademik
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ml-4">
                            <li class="nav-item">
                                <a href="{{ route('jadwal.index') }}" class="nav-link" id="DataJadwal">
                                    <i class="fas fa-calendar-alt nav-icon"></i>
                                    <p>Jadwal</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('siswa.index') }}" class="nav-link" id="DataSiswa">
                                    <i class="fas fa-users nav-icon"></i>
                                    <p>Siswa</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('walikelas.list') }}" class="nav-link" id="DataWaliKelas">
                                    <i class="fas fa-calendar-alt nav-icon"></i>
                                    <p>Wali Kelas</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('guru.index') }}" class="nav-link" id="DataGuru">
                                    <i class="fas fa-users nav-icon"></i>
                                    <p>Guru</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('mapel.index') }}" class="nav-link" id="DataMapel">
                                    <i class="fas fa-book nav-icon"></i>
                                    <p>Mata Pelajaran</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('kelas.index') }}" class="nav-link" id="DataKelas">
                                    <i class="fas fa-home nav-icon"></i>
                                    <p>Kelas</p>
                                </a>
                            </li>
{{--                            <li class="nav-item">--}}
{{--                                <a href="{{ route('paket.index') }}" class="nav-link" id="DataPaket">--}}
{{--                                    <i class="fas fa-user-plus nav-icon"></i>--}}
{{--                                    <p>Data Paket</p>--}}
{{--                                </a>--}}
{{--                            </li>--}}
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('user.index') }}" class="nav-link" id="DataUser">
                            <i class="fas fa-user-plus nav-icon"></i>
                            <p>Data Pengguna</p>
                        </a>
                    </li>
{{--                    <li class="nav-item">--}}
{{--                        <a href="{{ route('guru.absensi') }}" class="nav-link" id="AbsensiGuru">--}}
{{--                            <i class="fas fa-calendar-check nav-icon"></i>--}}
{{--                            <p>Absensi Guru</p>--}}
{{--                        </a>--}}
{{--                    </li>--}}
                    <li class="nav-item has-treeview" id="liNilai">
                        <a href="#" class="nav-link" id="Nilai">
                            <i class="nav-icon fas fa-file-signature"></i>
                            <p>
                                Nilai
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ml-4">
                            <li class="nav-item">
                                <a href="{{ route('ulangan-kelas') }}" class="nav-link" id="Ulangan">
                                    <i class="fas fa-file-alt nav-icon"></i>
                                    <p>Nilai Ulangan</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('sikap-kelas') }}" class="nav-link" id="Sikap">
                                    <i class="fas fa-file-alt nav-icon"></i>
                                    <p>Nilai Sikap</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('rapot-kelas') }}" class="nav-link" id="Rapot">
                                    <i class="fas fa-file-alt nav-icon"></i>
                                    <p>Nilai Rapot</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('predikat') }}" class="nav-link" id="Deskripsi">
                                    <i class="fas fa-file-alt nav-icon"></i>
                                    <p>Deskripsi Predikat</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                @elseif (Auth::user()->role == 'Guru' && Auth::user()->guru(Auth::user()->id_card))
                    <li class="nav-item has-treeview mt-5">
                        <a href="{{ url('/') }}" class="nav-link" id="Home">
                            <i class="nav-icon fas fa-home"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    @if (Auth::user()->guru(Auth::user()->id_card)->mapel->nama_mapel != "Nilai Sikap")
                    <li class="nav-item">
                        <a href="{{ route('tugas.kelas') }}" class="nav-link" id="TugasKelas">
                            <i class="fas fa-book-open nav-icon"></i>
                            <p>Tugas Kelas</p>
                        </a>
                    </li>
                    @else
                    @endif
                    @if (Auth::user()->guru(Auth::user()->id_card)->mapel->nama_mapel != "Nilai Sikap")
                    <li class="nav-item">
                        <a href="{{ route('materi.pelajaran') }}" class="nav-link" id="MateriPelajaran">
                            <i class="fas fa-book nav-icon"></i>
                            <p>Materi Pelajaran</p>
                        </a>
                    </li>
                    @else
                    @endif
{{--                    <li class="nav-item">--}}
{{--                        <a href="{{ route('absen.harian') }}" class="nav-link" id="AbsenGuru">--}}
{{--                            <i class="fas fa-calendar-check nav-icon"></i>--}}
{{--                            <p>Absen</p>--}}
{{--                        </a>--}}
{{--                    </li>--}}
                    <li class="nav-item">
                        <a href="{{ route('jadwal.guru') }}" class="nav-link" id="JadwalGuru">
                            <i class="fas fa-calendar-alt nav-icon"></i>
                            <p>Jadwal</p>
                        </a>
                    </li>
                    <li class="nav-item has-treeview" id="liNilaiGuru">
                        <a href="#" class="nav-link" id="NilaiGuru">
                            <i class="nav-icon fas fa-file-signature"></i>
                            <p>
                                Nilai
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ml-4">
                            @if (Auth::user()->guru(Auth::user()->id_card)->mapel->nama_mapel == "Nilai Sikap")
                                <li class="nav-item">
                                    <a href="{{ route('sikap.index') }}" class="nav-link" id="SikapGuru">
                                        <i class="fas fa-file-alt nav-icon"></i>
                                        <p>Entry Nilai Sikap</p>
                                    </a>
                                </li>
                            @else
                                <li class="nav-item">
                                    <a href="{{ route('ulangan.index') }}" class="nav-link" id="UlanganGuru">
                                        <i class="fas fa-file-alt nav-icon"></i>
                                        <p>Entry Nilai Ulangan</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ route('rapot.index') }}" class="nav-link" id="RapotGuru">
                                        <i class="fas fa-file-alt nav-icon"></i>
                                        <p>Entry Nilai Rapot</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{ route('nilai.index') }}" class="nav-link" id="DesGuru">
                                        <i class="fas fa-file-alt nav-icon"></i>
                                        <p>Deskripsi Predikat</p>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </li>
                    @if (Auth::user()->guru(Auth::user()->id_card)->mapel->nama_mapel != "Nilai Sikap")
                    <li class="nav-item">
                        <a href="{{route('absensi.kelas')}}" class="nav-link" id="AbsenSiswa">
                            <i class="fas fa-calendar nav-icon"></i>
                            <p>Input Absen</p>
                        </a>
                    </li>
                    @else
                    @endif
                    @php
                        $isInKelas = \App\Kelas::whereHas('guru', function ($query) {
                            $query->where('id_card', Auth::user()->id_card);
                        })->exists();
                    @endphp

                    @if($isInKelas)
                        <li class="nav-item">
                            <a href="{{ route('rekap.absensi') }}" class="nav-link" id="RekapAbsensi">
                                <i class="fas fa-book-dead nav-icon"></i>
                                <p>Rekap Absen</p>
                            </a>
                        </li>
                    @endif

                @elseif (Auth::user()->role == 'Siswa' && Auth::user()->siswa(Auth::user()->no_induk))
                    <li class="nav-item has-treeview">
                        <a href="{{ url('/') }}" class="nav-link" id="Home">
                            <i class="nav-icon fas fa-home"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('jadwal.siswa') }}" class="nav-link" id="JadwalSiswa">
                            <i class="fas fa-calendar-alt nav-icon"></i>
                            <p>Jadwal</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('ulangan.siswa') }}" class="nav-link" id="UlanganSiswa">
                            <i class="fas fa-file-alt nav-icon"></i>
                            <p>Ulangan</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('tugas.siswa') }}" class="nav-link" id="TugasSiswa">
                            <i class="fas fa-book nav-icon"></i>
                            <p>Tugas</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('materipelajaran.siswa') }}" class="nav-link" id="MateriPelajaran">
                            <i class="fas fa-book-reader nav-icon"></i>
                            <p>Materi Pelajaran</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('sikap.siswa') }}" class="nav-link" id="SikapSiswa">
                            <i class="fas fa-file-alt nav-icon"></i>
                            <p>Sikap</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('rapot.siswa') }}" class="nav-link" id="RapotSiswa">
                            <i class="fas fa-file-alt nav-icon"></i>
                            <p>Rapot</p>
                        </a>
                    </li>
                @else
                    <li class="nav-item has-treeview">
                        <a href="{{ url('/') }}" class="nav-link" id="Home">
                            <i class="nav-icon fas fa-home"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                @endif
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
