// lib/pages/halaman_pengaturan_kota.dart
import 'package:flutter/material.dart';

class HalamanPengaturanKota extends StatefulWidget {
  const HalamanPengaturanKota({super.key});

  @override
  State<HalamanPengaturanKota> createState() => _HalamanPengaturanKotaState();
}

class _HalamanPengaturanKotaState extends State<HalamanPengaturanKota> {
  bool _notifikasi = true;
  bool _lokasi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifikasi layanan'),
            subtitle: const Text('Terima kabar terbaru dari dinas kota'),
            value: _notifikasi,
            onChanged: (nilai) => setState(() => _notifikasi = nilai),
          ),
          SwitchListTile(
            title: const Text('Gunakan lokasi saya'),
            subtitle: const Text('Tampilkan layanan di sekitar Anda'),
            value: _lokasi,
            onChanged: (nilai) => setState(() => _lokasi = nilai),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.bug_report_outlined),
            title: const Text('Uji route tidak dikenal'),
            subtitle: const Text('Memanggil route "/salah" yang belum terdaftar'),
            onTap: () => Navigator.pushNamed(context, '/salah'),
          ),
        ],
      ),
    );
  }
}
