import 'package:flutter/material.dart';

/// StatelessWidget navigation bar.
/// currentIndex ditentukan manual per halaman (bukan lewat setState),
/// karena tiap tab sebenarnya adalah halaman/route yang berbeda.
class BookBottomNav extends StatelessWidget {
  final int currentIndex;
  const BookBottomNav({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    const routes = ['/home', '/kategori', '/favorite', '/riwayat', '/profil'];
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF3F51B5),
      unselectedItemColor: Colors.grey,
      onTap: (index) => _onTap(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: 'Kategori'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: 'Favorit'),
        BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'Riwayat'),
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
      ],
    );
  }
}
