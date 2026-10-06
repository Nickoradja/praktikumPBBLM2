// lib/models/favorit_model.dart
import 'package:flutter/foundation.dart';

/// State aplikasi: kumpulan nama layanan yang ditandai favorit.
/// Dipakai oleh tujuan Layanan (menandai) dan tujuan Warga (menampilkan).
class FavoritModel extends ChangeNotifier {
  final Set<String> _favorit = {};

  /// Salinan read-only agar UI tidak dapat mengubah isi himpunan secara langsung.
  Set<String> get favorit => Set.unmodifiable(_favorit);

  List<String> get daftarFavorit => List.unmodifiable(_favorit);

  int get totalFavorit => _favorit.length;

  bool apakahFavorit(String namaLayanan) => _favorit.contains(namaLayanan);

  void tandai(String namaLayanan) {
    // add() mengembalikan false jika sudah ada -> tidak perlu notifikasi.
    if (_favorit.add(namaLayanan)) {
      notifyListeners();
    }
  }

  void batalTandai(String namaLayanan) {
    if (_favorit.remove(namaLayanan)) {
      notifyListeners();
    }
  }
}
