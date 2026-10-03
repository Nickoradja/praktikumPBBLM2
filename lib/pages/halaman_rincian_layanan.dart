// lib/pages/halaman_rincian_layanan.dart
// Halaman penuh (dibuka lewat named route), maka memakai Scaffold sendiri.
import 'package:flutter/material.dart';

class HalamanRincianLayanan extends StatelessWidget {
  const HalamanRincianLayanan({
    super.key,
    required this.nama,
    required this.dinas,
    required this.jam,
    required this.keterangan,
  });

  final String nama;
  final String dinas;
  final String jam;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nama,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.apartment),
              title: const Text('Dinas Penanggung Jawab'),
              subtitle: Text(dinas),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.schedule),
              title: const Text('Jam Operasional'),
              subtitle: Text(jam),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.description_outlined),
              title: const Text('Keterangan'),
              subtitle: Text(keterangan),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kembali'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.pop(
                        context, 'Permohonan $nama telah diajukan.'),
                    child: const Text('Ajukan Permohonan'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
