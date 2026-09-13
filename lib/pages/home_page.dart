import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/book_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final kategoriList = ['Fiksi', 'Romansa', 'Misteri', 'Sains', 'Sejarah'];
    final bukuUnggulan = [
      {'judul': 'Laut Bercerita', 'penulis': 'Leila S. Chudori', 'kategori': 'Fiksi', 'rating': 4.8, 'warna': const Color(0xFF3F51B5)},
      {'judul': 'Bumi Manusia', 'penulis': 'Pramoedya A.T.', 'kategori': 'Sejarah', 'rating': 4.9, 'warna': const Color(0xFF009688)},
      {'judul': 'Filosofi Teras', 'penulis': 'Henry Manampiring', 'kategori': 'Sains', 'rating': 4.7, 'warna': const Color(0xFFFF7043)},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookNest'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.pushNamed(context, '/pengaturan'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari judul atau penulis...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/kategori'), child: const Text('Lihat semua')),
            ],
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: kategoriList.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) => Chip(label: Text(kategoriList[i]), backgroundColor: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Buku Pilihan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/daftar-cerita'), child: const Text('Lihat semua')),
            ],
          ),
          const SizedBox(height: 8),
          ...bukuUnggulan.map((b) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: BookCard(
                  judul: b['judul'] as String,
                  penulis: b['penulis'] as String,
                  kategori: b['kategori'] as String,
                  rating: b['rating'] as double,
                  warna: b['warna'] as Color,
                ),
              )),
        ],
      ),
      bottomNavigationBar: const BookBottomNav(currentIndex: 0),
    );
  }
}
