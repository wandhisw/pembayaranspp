-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jan 2024 pada 16.43
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensekolah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absen`
--

CREATE TABLE `absen` (
  `id_absen` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `id_mapel` varchar(20) NOT NULL,
  `id_pertemuan` varchar(20) NOT NULL,
  `keterangan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`) VALUES
(1, 'matematika'),
(2, 'bahasa indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pertemuan`
--

CREATE TABLE `pertemuan` (
  `id_pertemuan` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nim` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `mata_pelajaran1` varchar(50) NOT NULL,
  `mata_pelajaran2` varchar(50) NOT NULL,
  `mata_pelajaran3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', '12345');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`),
  ADD UNIQUE KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD PRIMARY KEY (`id_pertemuan`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pertemuan`
--
ALTER TABLE `pertemuan`
  MODIFY `id_pertemuan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `siswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
