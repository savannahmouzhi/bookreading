import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/daftar_cerita_page.dart';
import 'pages/reading_page.dart';
import 'pages/favorite_page.dart';
import 'pages/kategori_page.dart';
import 'pages/profil_page.dart';
import 'pages/riwayat_page.dart';
import 'pages/pengaturan_page.dart';

void main() {
  runApp(const BookNestApp());
}

class BookNestApp extends StatelessWidget {
  const BookNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookNest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3F51B5),
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      // Semua halaman adalah StatelessWidget.
      // Navigasi antar halaman memakai named routes + Navigator.
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/daftar-cerita': (context) => const DaftarCeritaPage(),
        '/favorite': (context) => const FavoritePage(),
        '/kategori': (context) => const KategoriPage(),
        '/profil': (context) => const ProfilPage(),
        '/riwayat': (context) => const RiwayatPage(),
        '/pengaturan': (context) => const PengaturanPage(),
      },
      // Route khusus /reading butuh argumen (judul & penulis buku)
      onGenerateRoute: (settings) {
        if (settings.name == '/reading') {
          final args = settings.arguments as Map<String, String>? ??
              {'judul': 'Judul Buku', 'penulis': 'Penulis'};
          return MaterialPageRoute(
            builder: (context) => ReadingPage(
              judul: args['judul']!,
              penulis: args['penulis']!,
            ),
          );
        }
        return null;
      },
    );
  }
}
