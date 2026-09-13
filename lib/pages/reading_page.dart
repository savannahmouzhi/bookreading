import 'package:flutter/material.dart';

class ReadingPage extends StatelessWidget {
  final String judul;
  final String penulis;
  const ReadingPage({super.key, required this.judul, required this.penulis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(judul, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('oleh $penulis', style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 20),
            const Text(
              'Bab 1\n\n'
              'Ini adalah halaman baca (reading page) untuk menampilkan isi cerita/buku. '
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Halaman ini bisa '
              'discroll untuk membaca isi cerita secara penuh.\n\n'
              'Teks ini hanya contoh tampilan (mockup) tanpa data isi cerita yang sebenarnya.',
              style: TextStyle(fontSize: 15, height: 1.6),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const Text('Ulasan Pembaca', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _ulasan('Rina A.', 'Ceritanya menarik dan alurnya rapi!', 5),
            _ulasan('Budi S.', 'Bagus, tapi endingnya agak terburu-buru.', 4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tulis Ulasan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(hintText: 'Bagikan pendapatmu...', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Kirim')),
                  ),
                ],
              ),
            ),
          );
        },
        icon: const Icon(Icons.rate_review_outlined),
        label: const Text('Ulas'),
      ),
    );
  }

  Widget _ulasan(String nama, String isi, int bintang) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(child: Text(nama[0])),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(nama, style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(width: 8),
                    Row(children: List.generate(5, (i) => Icon(i < bintang ? Icons.star : Icons.star_border, size: 14, color: Colors.amber))),
                  ],
                ),
                const SizedBox(height: 4),
                Text(isi, style: TextStyle(color: Colors.grey[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
