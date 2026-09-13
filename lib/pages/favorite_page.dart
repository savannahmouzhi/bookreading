import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/book_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorit = [
      {'judul': 'Laut Bercerita', 'penulis': 'Leila S. Chudori', 'kategori': 'Fiksi', 'rating': 4.8, 'warna': const Color(0xFF3F51B5)},
      {'judul': 'Dilan 1990', 'penulis': 'Pidi Baiq', 'kategori': 'Romansa', 'rating': 4.5, 'warna': const Color(0xFFE91E63)},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Favorit')),
      body: favorit.isEmpty
          ? const Center(child: Text('Belum ada buku favorit'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favorit.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final b = favorit[i];
                return BookCard(
                  judul: b['judul'] as String,
                  penulis: b['penulis'] as String,
                  kategori: b['kategori'] as String,
                  rating: b['rating'] as double,
                  warna: b['warna'] as Color,
                );
              },
            ),
      bottomNavigationBar: const BookBottomNav(currentIndex: 2),
    );
  }
}
