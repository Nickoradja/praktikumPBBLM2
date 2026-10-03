import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nusantara_cerdas_nav_707012400144/main.dart';

void main() {
  testWidgets('Aplikasi menampilkan Beranda dan NavigationBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const NusantaraCerdasApp());
    await tester.pumpAndSettle();

    expect(find.text('Beranda'), findsWidgets);
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}