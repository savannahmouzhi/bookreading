import 'package:flutter/material.dart';
import '../widgets/book_card.dart';

class DaftarCeritaPage extends StatelessWidget {
  const DaftarCeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final semuaBuku = [
      {'judul': 'Laut Bercerita', 'penulis': 'Leila S. Chudori', 'kategori': 'Fiksi', 'rating': 4.8, 'warna': const Color(0xFF3F51B5)},
      {'judul': 'Bumi Manusia', 'penulis': 'Pramoedya A.T.', 'kategori': 'Sejarah', 'rating': 4.9, 'warna': const Color(0xFF009688)},
      {'judul': 'Filosofi Teras', 'penulis': 'Henry Manampiring', 'kategori': 'Sains', 'rating': 4.7, 'warna': const Color(0xFFFF7043)},
      {'judul': 'Dilan 1990', 'penulis': 'Pidi Baiq', 'kategori': 'Romansa', 'rating': 4.5, 'warna': const Color(0xFFE91E63)},
      {'judul': 'Sherlock Holmes', 'penulis': 'Arthur C. Doyle', 'kategori': 'Misteri', 'rating': 4.6, 'warna': const Color(0xFF607D8B)},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Cerita')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: semuaBuku.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final b = semuaBuku[i];
          return BookCard(
            judul: b['judul'] as String,
            penulis: b['penulis'] as String,
            kategori: b['kategori'] as String,
            rating: b['rating'] as double,
            warna: b['warna'] as Color,
          );
        },
      ),
    );
  }
}
