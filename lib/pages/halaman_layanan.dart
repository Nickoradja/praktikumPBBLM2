// lib/pages/halaman_layanan.dart
// Tanpa Scaffold: tampil di dalam Scaffold milik KerangkaNavigasi.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatefulWidget {
  const HalamanLayanan({super.key});

  @override
  State<HalamanLayanan> createState() => _HalamanLayananState();
}

class _HalamanLayananState extends State<HalamanLayanan> {
  static const List<Map<String, String>> _perizinan = [
    {
      'nama': 'Izin Usaha',
      'dinas': 'Dinas Penanaman Modal dan PTSP',
      'jam': 'Senin-Jumat, 08.00-15.00',
      'keterangan': 'Pengajuan izin usaha mikro, kecil, dan menengah.',
    },
    {
      'nama': 'Izin Mendirikan Bangunan',
      'dinas': 'Dinas Pekerjaan Umum dan Tata Ruang',
      'jam': 'Senin-Jumat, 08.00-15.00',
      'keterangan': 'Persetujuan bangunan gedung untuk hunian dan usaha.',
    },
    {
      'nama': 'Izin Keramaian',
      'dinas': 'Dinas Komunikasi dan Informatika',
      'jam': 'Senin-Jumat, 08.00-14.00',
      'keterangan': 'Izin penyelenggaraan acara atau kegiatan masyarakat.',
    },
  ];

  static const List<Map<String, String>> _kesehatan = [
    {
      'nama': 'Pendaftaran Puskesmas Online',
      'dinas': 'Dinas Kesehatan',
      'jam': 'Setiap hari, 07.00-12.00',
      'keterangan': 'Daftar antrean poli umum tanpa datang lebih awal.',
    },
    {
      'nama': 'Imunisasi Anak',
      'dinas': 'Dinas Kesehatan',
      'jam': 'Selasa dan Kamis, 08.00-11.00',
      'keterangan': 'Jadwal dan pendaftaran imunisasi dasar anak.',
    },
    {
      'nama': 'Ambulans Gawat Darurat',
      'dinas': 'Dinas Kesehatan',
      'jam': '24 jam',
      'keterangan': 'Layanan ambulans untuk kondisi darurat.',
    },
  ];

  static const List<Map<String, String>> _transportasi = [
    {
      'nama': 'Jadwal Bus Kota',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Setiap hari, 05.00-21.00',
      'keterangan': 'Informasi rute dan jadwal keberangkatan bus kota.',
    },
    {
      'nama': 'Perpanjangan KIR Kendaraan',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Senin-Jumat, 08.00-15.00',
      'keterangan': 'Pendaftaran uji berkala kendaraan bermotor.',
    },
    {
      'nama': 'Laporan Kerusakan Lampu Lalu Lintas',
      'dinas': 'Dinas Perhubungan',
      'jam': '24 jam',
      'keterangan': 'Laporkan lampu lalu lintas yang mati atau rusak.',
    },
  ];

  Future<void> _bukaRincian(Map<String, String> layanan) async {
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.rincian,
      arguments: layanan,
    );

    if (!mounted) return;

    if (hasil is String) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(hasil)),
      );
    }
  }

  Widget _buatDaftar(List<Map<String, String>> daftar) {
    return ListView.separated(
      itemCount: daftar.length,
      separatorBuilder: (context, indeks) => const Divider(height: 1),
      itemBuilder: (context, indeks) {
        final layanan = daftar[indeks];
        return _ItemLayanan(
          layanan: layanan,
          onTap: () => _bukaRincian(layanan),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // length, jumlah Tab, dan jumlah anak TabBarView sama-sama tiga.
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: 'Perizinan'),
              Tab(icon: Icon(Icons.local_hospital), text: 'Kesehatan'),
              Tab(icon: Icon(Icons.directions_bus), text: 'Transportasi'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buatDaftar(_perizinan),
                _buatDaftar(_kesehatan),
                _buatDaftar(_transportasi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Satu baris layanan dengan ikon bintang favorit.
// Dibuat sebagai widget sendiri agar context.watch hanya membangun ulang
// baris ini ketika status favoritnya berubah.
class _ItemLayanan extends StatelessWidget {
  const _ItemLayanan({required this.layanan, required this.onTap});

  final Map<String, String> layanan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final nama = layanan['nama']!;

    // watch: warna/bentuk bintang harus mengikuti status favorit.
    final favorit = context.watch<FavoritModel>().apakahFavorit(nama);

    return ListTile(
      leading: const Icon(Icons.article_outlined),
      title: Text(nama),
      subtitle: Text(layanan['dinas']!),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: favorit ? 'Batalkan favorit' : 'Tandai favorit',
            icon: Icon(
              favorit ? Icons.star : Icons.star_border,
              color: favorit ? Colors.amber.shade700 : null,
            ),
            onPressed: () {
              // read: di dalam callback hanya memanggil operasi.
              final model = context.read<FavoritModel>();
              if (favorit) {
                model.batalTandai(nama);
              } else {
                model.tandai(nama);
              }
            },
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
