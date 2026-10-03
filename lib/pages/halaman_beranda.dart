// lib/pages/halaman_beranda.dart
// Tanpa Scaffold: tampil di dalam Scaffold milik KerangkaNavigasi.
import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  static const List<Map<String, Object>> _pilar = [
    {'nama': 'Smart Governance', 'ikon': Icons.account_balance},
    {'nama': 'Smart Branding', 'ikon': Icons.campaign},
    {'nama': 'Smart Economy', 'ikon': Icons.trending_up},
    {'nama': 'Smart Living', 'ikon': Icons.apartment},
    {'nama': 'Smart Society', 'ikon': Icons.groups},
    {'nama': 'Smart Environment', 'ikon': Icons.eco},
  ];

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return LayoutBuilder(
      builder: (context, batas) {
        final int kolom = batas.maxWidth >= 600 ? 3 : 2;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Selamat datang di Nusantara Cerdas',
                style: tema.textTheme.titleLarge),
            const SizedBox(height: 4),
            const Text('Ringkasan enam pilar smart city Kota Nusantara.'),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: kolom,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                for (final p in _pilar)
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(p['ikon'] as IconData,
                            size: 36, color: tema.colorScheme.primary),
                        const SizedBox(height: 8),
                        Text(p['nama'] as String,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
