import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 44, child: Icon(Icons.person, size: 44)),
          const SizedBox(height: 12),
          const Center(child: Text('Nadia Putri', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          Center(child: Text('nadia.putri@email.com', style: TextStyle(color: Colors.grey[600]))),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _statistik('24', 'Dibaca'),
              _statistik('12', 'Favorit'),
              _statistik('8', 'Ulasan'),
            ],
          ),
          const SizedBox(height: 24),
          _menuItem(context, Icons.history, 'Riwayat Baca', '/riwayat'),
          _menuItem(context, Icons.favorite_border, 'Buku Favorit', '/favorite'),
          _menuItem(context, Icons.settings_outlined, 'Pengaturan', '/pengaturan'),
          _menuItem(context, Icons.logout, 'Keluar', '/login'),
        ],
      ),
      bottomNavigationBar: const BookBottomNav(currentIndex: 4),
    );
  }

  Widget _statistik(String angka, String label) => Column(
        children: [
          Text(angka, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      );

  Widget _menuItem(BuildContext context, IconData ikon, String judul, String route) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(ikon),
        title: Text(judul),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          if (route == '/login') {
            // Keluar -> hapus semua history route, kembali ke login
            Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false);
          } else {
            Navigator.pushNamed(context, route);
          }
        },
      ),
    );
  }
}
