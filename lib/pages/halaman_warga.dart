// lib/pages/halaman_warga.dart
// Tanpa Scaffold: tampil di dalam Scaffold milik KerangkaNavigasi.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text('Nicko Radja Athallah',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const Center(child: Text('Warga Kota Nusantara')),
        const Center(child: Text('NIM 707012400144 - D4 SIKC 4803')),
        const SizedBox(height: 24),
        const Text('Layanan Favorit',
            style: TextStyle(fontWeight: FontWeight.bold)),
        // Consumer: hanya bagian ini yang dibangun ulang saat favorit berubah,
        // tanpa memandang tab bidang asal layanan.
        Consumer<FavoritModel>(
          builder: (context, favorit, child) {
            if (favorit.daftarFavorit.isEmpty) {
              return const ListTile(
                leading: Icon(Icons.star_border),
                title: Text('Belum ada layanan favorit'),
                subtitle: Text('Tandai bintang pada tujuan Layanan.'),
              );
            }
            return Column(
              children: [
                for (final nama in favorit.daftarFavorit)
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.amber.shade700),
                    title: Text(nama),
                    trailing: IconButton(
                      tooltip: 'Batalkan favorit',
                      icon: const Icon(Icons.close),
                      onPressed: () => favorit.batalTandai(nama),
                    ),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        const Text('Keranjang Pengajuan',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Consumer<PengajuanModel>(
          builder: (context, pengajuan, child) {
            if (pengajuan.daftarLayanan.isEmpty) {
              return const ListTile(
                leading: Icon(Icons.inbox_outlined),
                title: Text('Belum ada layanan yang diajukan'),
                subtitle:
                    Text('Buka rincian layanan lalu tekan Ajukan Permohonan.'),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final nama in pengajuan.daftarLayanan)
                  ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: Text(nama),
                    trailing: IconButton(
                      tooltip: 'Hapus dari keranjang',
                      icon: const Icon(Icons.close),
                      onPressed: () => pengajuan.hapus(nama),
                    ),
                  ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    final jumlah = pengajuan.totalPengajuan;
                    pengajuan.kosongkan();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('$jumlah permohonan dikirim ke dinas terkait.'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.send),
                  label: Text('Kirim Semua (${pengajuan.totalPengajuan})'),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        const Text('Ringkasan Laporan Terakhir',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const ListTile(
          leading: Icon(Icons.report_outlined),
          title: Text('Jalan berlubang di Jl. Merdeka'),
          subtitle: Text('Status: Diproses'),
        ),
        const ListTile(
          leading: Icon(Icons.report_outlined),
          title: Text('Lampu jalan padam di Jl. Mawar'),
          subtitle: Text('Status: Selesai'),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.riwayatLaporan),
          icon: const Icon(Icons.history),
          label: const Text('Lihat Riwayat Laporan'),
        ),
      ],
    );
  }
}
