import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final riwayat = [
      {'judul': 'Laut Bercerita', 'tanggal': '10 Sep 2026', 'progres': 1.0},
      {'judul': 'Bumi Manusia', 'tanggal': '8 Sep 2026', 'progres': 0.6},
      {'judul': 'Filosofi Teras', 'tanggal': '2 Sep 2026', 'progres': 0.3},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: riwayat.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final r = riwayat[i];
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(r['judul'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Terakhir dibaca: ${r['tanggal']}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: r['progres'] as double, borderRadius: BorderRadius.circular(8)),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BookBottomNav(currentIndex: 3),
    );
  }
}
