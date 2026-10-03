// lib/pages/halaman_keluar.dart
import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanKeluar extends StatelessWidget {
  const HalamanKeluar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keluar')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout, size: 64),
              const SizedBox(height: 12),
              const Text('Yakin ingin keluar dari akun Anda?'),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    // Kosongkan tumpukan, lalu mulai lagi dari Beranda.
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.beranda,
                      (route) => false,
                    ),
                    child: const Text('Keluar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
