// lib/widgets/ikon_warga_badge.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pengajuan_model.dart';

/// Ikon tujuan Warga dengan badge jumlah pengajuan.
/// Dipisah menjadi widget sendiri agar context.select hanya membangun ulang
/// badge, bukan NavigationBar maupun NavigationRail.
class IkonWargaBadge extends StatelessWidget {
  const IkonWargaBadge({super.key, this.terpilih = false});

  final bool terpilih;

  @override
  Widget build(BuildContext context) {
    final total = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return Badge(
      isLabelVisible: total > 0,
      label: Text('$total'),
      child: Icon(terpilih ? Icons.people : Icons.people_outline),
    );
  }
}
