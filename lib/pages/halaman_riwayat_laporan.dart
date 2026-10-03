// lib/pages/halaman_riwayat_laporan.dart
// Halaman penuh: memakai Scaffold + BottomAppBar + FloatingActionButton.
import 'package:flutter/material.dart';

class HalamanRiwayatLaporan extends StatelessWidget {
  const HalamanRiwayatLaporan({super.key});

  void _tampilkanPesan(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(pesan)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.report_outlined),
            title: Text('Jalan berlubang di Jl. Merdeka'),
            subtitle: Text('12 September 2026 - Diproses'),
          ),
          ListTile(
            leading: Icon(Icons.report_outlined),
            title: Text('Lampu jalan padam di Jl. Mawar'),
            subtitle: Text('3 September 2026 - Selesai'),
          ),
          ListTile(
            leading: Icon(Icons.report_outlined),
            title: Text('Sampah menumpuk di Pasar Baru'),
            subtitle: Text('25 Agustus 2026 - Selesai'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tampilkanPesan(context, 'Buat laporan baru'),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _tampilkanPesan(context, 'Cari laporan'),
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => _tampilkanPesan(context, 'Filter laporan'),
            ),
            const SizedBox(width: 40), // ruang untuk FAB
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () => _tampilkanPesan(context, 'Urutkan laporan'),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => _tampilkanPesan(context, 'Menu lainnya'),
            ),
          ],
        ),
      ),
    );
  }
}
