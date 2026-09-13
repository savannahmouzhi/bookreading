# BookNest — Aplikasi Review Buku (UI Flutter)

Project ini adalah tugas desain tampilan aplikasi mereview buku, dibuat dengan:
- **StatelessWidget** di semua halaman (tidak ada `StatefulWidget`/`setState`).
- **Navigasi antar halaman** memakai `Navigator` dengan **named routes**, didefinisikan di `lib/main.dart`.

## Struktur Halaman

| Halaman         | Route             | File                                  |
|-----------------|-------------------|----------------------------------------|
| Login           | `/login`          | `lib/pages/login_page.dart`            |
| Home            | `/home`           | `lib/pages/home_page.dart`             |
| Daftar Cerita   | `/daftar-cerita`  | `lib/pages/daftar_cerita_page.dart`    |
| Reading Page    | `/reading`        | `lib/pages/reading_page.dart`          |
| Favorite        | `/favorite`       | `lib/pages/favorite_page.dart`         |
| Kategori        | `/kategori`       | `lib/pages/kategori_page.dart`         |
| Profil          | `/profil`         | `lib/pages/profil_page.dart`           |
| Riwayat         | `/riwayat`        | `lib/pages/riwayat_page.dart`          |
| Pengaturan      | `/pengaturan`     | `lib/pages/pengaturan_page.dart`       |

Widget bersama (`lib/widgets/`):
- `bottom_nav.dart` — bottom navigation bar untuk Home, Kategori, Favorit, Riwayat, Profil.
- `book_card.dart` — kartu buku yang dipakai di Home, Daftar Cerita, dan Favorite. Tap kartu akan membuka Reading Page sambil membawa data judul & penulis lewat `Navigator.pushNamed(... arguments: {...})`.

## Alur Navigasi Singkat

1. **Login** → tombol "Masuk" → `pushReplacementNamed('/home')`
2. **Home** → bottom nav / tombol "Lihat semua" → Kategori, Daftar Cerita
3. **Daftar Cerita / Home / Favorite** → tap kartu buku → **Reading Page** (bawa argumen judul & penulis)
4. **Profil** → menu → Riwayat, Favorit, Pengaturan, atau Keluar (`pushNamedAndRemoveUntil` kembali ke Login)
5. **Home** → ikon gear di AppBar → **Pengaturan**

## Cara Menjalankan di VS Code

1. Pastikan Flutter SDK sudah terpasang (`flutter doctor` tidak ada error blocking).
2. Buka folder `booknest` ini di VS Code (harus punya ekstensi **Flutter** & **Dart**).
3. Buka terminal, jalankan:
   ```bash
   flutter pub get
   flutter run
   ```
4. Pilih device/emulator yang tersedia (Chrome, Android emulator, dsb).

## Catatan Desain
- Warna utama: indigo (`#3F51B5`), dengan aksen teal/oranye/pink per kategori buku.
- Data buku, kategori, riwayat, dan ulasan masih berupa **data dummy (hardcoded)** di dalam masing-masing halaman — sesuai fokus tugas ini yaitu desain tampilan + navigasi, bukan integrasi backend/state management.
- Karena semua widget stateless, interaksi seperti "isi form login" atau "toggle switch di pengaturan" bersifat visual saja (tidak menyimpan state); yang penting alur perpindahan halaman (routing) sudah berfungsi penuh.
