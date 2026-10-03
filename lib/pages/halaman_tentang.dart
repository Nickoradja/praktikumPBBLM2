// lib/pages/halaman_tentang.dart
import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_city, size: 72),
              SizedBox(height: 12),
              Text('Nusantara Cerdas Mobile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Versi 1.0.0 (purwarupa)'),
              SizedBox(height: 12),
              Text(
                'Aplikasi layanan warga Pemerintah Kota Nusantara '
                'yang menghimpun layanan publik dalam satu tempat.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
