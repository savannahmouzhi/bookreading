import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String judul;
  final String penulis;
  final String kategori;
  final double rating;
  final Color warna;

  const BookCard({
    super.key,
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.rating,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        // Navigasi ke reading page sambil membawa data judul & penulis
        Navigator.pushNamed(context, '/reading', arguments: {
          'judul': judul,
          'penulis': penulis,
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 76,
              decoration: BoxDecoration(color: warna, borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(penulis, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Chip(
                        label: Text(kategori, style: const TextStyle(fontSize: 11)),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: warna.withOpacity(0.1),
                      ),
                      const Spacer(),
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                      Text(' $rating', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
