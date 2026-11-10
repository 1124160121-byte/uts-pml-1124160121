import 'package:flutter/material.dart';

// a. void main() memanggil runApp() dengan MyApp (StatelessWidget)
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 import 'package:flutter/material.dart';

// a. void main() memanggil runApp() dengan MyApp (StatelessWidget)
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // b. Konfigurasi MaterialApp
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
      // Bagian c akan mengarah ke ProfilePage() di bawah
      home: const ProfilePage(),
    );
  }
}
    return const Placeholder();
  }
}
//membuat bagian a struktur MyApp untuk menjalankan program
