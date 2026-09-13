import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kategori = [
      {'nama': 'Fiksi', 'ikon': Icons.auto_stories, 'warna': const Color(0xFF3F51B5)},
      {'nama': 'Romansa', 'ikon': Icons.favorite, 'warna': const Color(0xFFE91E63)},
      {'nama': 'Misteri', 'ikon': Icons.search, 'warna': const Color(0xFF607D8B)},
      {'nama': 'Sains', 'ikon': Icons.science, 'warna': const Color(0xFFFF7043)},
      {'nama': 'Sejarah', 'ikon': Icons.account_balance, 'warna': const Color(0xFF009688)},
      {'nama': 'Biografi', 'ikon': Icons.person, 'warna': const Color(0xFF9C27B0)},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Kategori')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 1.3,
        ),
        itemCount: kategori.length,
        itemBuilder: (context, i) {
          final k = kategori[i];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            // Tap kategori -> lempar ke daftar cerita
            onTap: () => Navigator.pushNamed(context, '/daftar-cerita'),
            child: Container(
              decoration: BoxDecoration(
                color: (k['warna'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(k['ikon'] as IconData, color: k['warna'] as Color, size: 32),
                  const SizedBox(height: 8),
                  Text(k['nama'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BookBottomNav(currentIndex: 1),
    );
  }
}
