// lib/pages/halaman_warga.dart
// Tanpa Scaffold: tampil di dalam Scaffold milik KerangkaNavigasi.
import 'package:flutter/material.dart';
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
