// lib/models/pengajuan_model.dart
import 'package:flutter/foundation.dart';

/// State aplikasi: keranjang layanan yang sedang diajukan warga.
class PengajuanModel extends ChangeNotifier {
  final List<String> _layanan = [];

  List<String> get daftarLayanan => List.unmodifiable(_layanan);

  /// Jumlah layanan yang sedang diajukan (dipakai badge pada tujuan Warga).
  int get totalPengajuan => _layanan.length;

  bool sudahDiajukan(String namaLayanan) => _layanan.contains(namaLayanan);

  /// true jika berhasil ditambahkan, false jika sudah ada di keranjang.
  bool tambah(String namaLayanan) {
    if (_layanan.contains(namaLayanan)) return false;
    _layanan.add(namaLayanan);
    notifyListeners();
    return true;
  }

  void hapus(String namaLayanan) {
    if (_layanan.remove(namaLayanan)) {
      notifyListeners();
    }
  }

  /// Dipanggil setelah semua pengajuan dikirim sekaligus ke dinas terkait.
  void kosongkan() {
    if (_layanan.isEmpty) return;
    _layanan.clear();
    notifyListeners();
  }
}
