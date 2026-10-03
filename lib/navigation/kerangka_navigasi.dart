// lib/navigation/kerangka_navigasi.dart
import 'package:flutter/material.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  // Jumlah halaman, judul, dan destination harus sama (tiga).
  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  final List<String> _judul = const ['Beranda', 'Layanan', 'Warga'];

  void _pilihTujuan(int indeks) {
    setState(() => _indeksTerpilih = indeks);
  }

  @override
  Widget build(BuildContext context) {
    final bool layarLebar = MediaQuery.of(context).size.width >= 600;

    // PopScope: tombol kembali perangkat pada tujuan selain Beranda
    // mengembalikan ke Beranda, bukan menutup aplikasi.
    return PopScope(
      canPop: _indeksTerpilih == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _pilihTujuan(0);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(_judul[_indeksTerpilih])),
        drawer: _buatDrawer(),
        body: layarLebar ? _tataLetakLebar() : _halaman[_indeksTerpilih],
        bottomNavigationBar: layarLebar ? null : _buatBilahBawah(),
      ),
    );
  }

  // Layar sempit: NavigationBar di bawah.
  Widget _buatBilahBawah() {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Beranda',
        ),
        NavigationDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: 'Layanan',
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: 'Warga',
        ),
      ],
    );
  }

  // Layar lebar: NavigationRail di kiri, isi di kanan.
  Widget _tataLetakLebar() {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeksTerpilih,
          onDestinationSelected: _pilihTujuan,
          extended: true,
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Icon(Icons.location_city, size: 32),
          ),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.miscellaneous_services_outlined),
              selectedIcon: Icon(Icons.miscellaneous_services),
              label: Text('Layanan'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.people_outline),
              selectedIcon: Icon(Icons.people),
              label: Text('Warga'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _halaman[_indeksTerpilih]),
      ],
    );
  }

  // Drawer: tiga tujuan utama + tiga menu pendukung.
  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (indeks) {
        _pilihTujuan(indeks);
        Navigator.pop(context); // tutup drawer
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Nicko Radja Athallah'),
          accountEmail: Text('warga@nusantaracerdas.go.id'),
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: Text('Layanan'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: Text('Warga'),
        ),
        const Divider(indent: 28, endIndent: 28),
        _menuPendukung(Icons.settings_outlined, 'Pengaturan Kota',
            AppRoutes.pengaturanKota),
        _menuPendukung(
            Icons.info_outline, 'Tentang Aplikasi', AppRoutes.tentang),
        _menuPendukung(Icons.logout, 'Keluar', AppRoutes.keluar),
      ],
    );
  }

  Widget _menuPendukung(IconData ikon, String judul, String namaRoute) {
    return ListTile(
      leading: Icon(ikon),
      title: Text(judul),
      onTap: () {
        Navigator.pop(context); // drawer ditutup dahulu
        Navigator.pushNamed(context, namaRoute);
      },
    );
  }
}
