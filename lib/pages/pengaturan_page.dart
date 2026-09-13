import 'package:flutter/material.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        children: [
          const _SectionTitle('Akun'),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Edit Profil'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/profil'),
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Ubah Kata Sandi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const _SectionTitle('Preferensi'),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Mode Gelap'),
            value: false,
            onChanged: (_) {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_none),
            title: const Text('Notifikasi'),
            value: true,
            onChanged: (_) {},
          ),
          const _SectionTitle('Lainnya'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Keluar', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(title, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }
}
