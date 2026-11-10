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
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Mahasiswa')),
      body: const Center(child: Text('Halaman Profil')),
    );
  }
}
