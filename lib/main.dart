import 'package:flutter/material.dart';

// a. void main() memanggil runApp() dengan MyApp (StatelessWidget)
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // b. Konfigurasi MaterialApp: title, debugShowCheckedModeBanner, theme, darkTheme, themeMode
    return MaterialApp(
      title: 'Profil Ande Saputra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      // c. home mengarah ke ProfilePage (StatelessWidget)
      home: const ProfilePage(),
    );
  }
}

// c. ProfilePage (StatelessWidget)
// Tahap 2 - Scaffold dan Head Profil (Materi 4 & 5)
// a. ProfilePage memakai Scaffold dengan AppBar berjudul Profil Mahasiswa dan minimal satu IconButton di actions.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Pengaturan',
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(child: Text('Halaman Profil')),
    );
  }
}
