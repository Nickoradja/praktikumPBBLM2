// lib/navigation/app_routes.dart
import 'package:flutter/material.dart';
import '../pages/halaman_keluar.dart';
import '../pages/halaman_pengaturan_kota.dart';
import '../pages/halaman_rincian_layanan.dart';
import '../pages/halaman_riwayat_laporan.dart';
import '../pages/halaman_tentang.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  // Seluruh nama route disimpan sebagai konstanta.
  static const String beranda = '/';
  static const String rincian = '/rincian';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentang = '/tentang';
  static const String keluar = '/keluar';

  // Route tanpa argumen.
  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      riwayatLaporan: (context) => const HalamanRiwayatLaporan(),
      pengaturanKota: (context) => const HalamanPengaturanKota(),
      tentang: (context) => const HalamanTentang(),
      keluar: (context) => const HalamanKeluar(),
    };
  }

  // Route yang membutuhkan argumen.
  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == rincian) {
      final argumen = settings.arguments as Map<String, String>? ?? const {};
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => HalamanRincianLayanan(
          nama: argumen['nama'] ?? 'Tanpa Nama',
          dinas: argumen['dinas'] ?? '-',
          jam: argumen['jam'] ?? '-',
          keterangan: argumen['keterangan'] ?? 'Tidak ada keterangan.',
        ),
      );
    }
    return null;
  }

  // Dipakai ketika nama route tidak terdaftar.
  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Route Tidak Ditemukan')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 64),
                const SizedBox(height: 12),
                Text(
                  'Route "${settings.name}" belum terdaftar.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
