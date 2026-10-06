// lib/pages/halaman_rincian_layanan.dart
// Halaman penuh (dibuka lewat named route), maka memakai Scaffold sendiri.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pengajuan_model.dart';

class HalamanRincianLayanan extends StatefulWidget {
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
  State<HalamanRincianLayanan> createState() => _HalamanRincianLayananState();
}

class _HalamanRincianLayananState extends State<HalamanRincianLayanan> {
  // State lokal: hanya penting bagi halaman ini -> setState().
  bool _sedangMengirim = false;

  Future<void> _ajukanPermohonan() async {
    setState(() {
      _sedangMengirim = true;
    });

    // Simulasi proses pencatatan permohonan.
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return; // halaman mungkin sudah ditutup selama menunggu

    // read: hanya memanggil operasi, tidak perlu mendengarkan perubahan.
    final berhasil = context.read<PengajuanModel>().tambah(widget.nama);

    // Nilai balik ke halaman sebelumnya (seperti pada Modul II).
    Navigator.pop(
      context,
      berhasil
          ? 'Permohonan ${widget.nama} telah diajukan.'
          : 'Permohonan ${widget.nama} sudah ada di keranjang pengajuan.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.nama,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.apartment),
              title: const Text('Dinas Penanggung Jawab'),
              subtitle: Text(widget.dinas),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.schedule),
              title: const Text('Jam Operasional'),
              subtitle: Text(widget.jam),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.description_outlined),
              title: const Text('Keterangan'),
              subtitle: Text(widget.keterangan),
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
                    // null = tombol nonaktif: mencegah penekanan berulang.
                    onPressed: _sedangMengirim ? null : _ajukanPermohonan,
                    child: _sedangMengirim
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 18,
                                height: 18,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                              SizedBox(width: 8),
                              Text('Mengirim...'),
                            ],
                          )
                        : const Text('Ajukan Permohonan'),
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
