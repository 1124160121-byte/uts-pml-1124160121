import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/profile_page.dart';
import 'screens/about_page.dart';

// Global ValueNotifier untuk mengelola ThemeMode (light/dark) di seluruh aplikasi secara langsung
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

// Data profil default
final Profile defaultProfile = Profile(
  name: 'Ande Saputra',
  nim: '1124160121',
  programStudi: 'Teknik Informatika',
  kelas: 'TI24SE SH',
  bio: 'Mahasiswa Teknik Informatika yang antusias belajar pemrograman mobile dengan Flutter.',
  email: 'andesaputra@example.com',
  phone: '0895331386142',
  github: 'github.com/andesaputra',
  imageAsset: 'assets/images/profile.jpg',
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'Aplikasi Profil Pengguna',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          // 1. Tema Terang (Light Theme) dengan palet warna custom
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF1E88E5),
              brightness: Brightness.light,
              primary: const Color(0xFF1E88E5), // Biru utama
              secondary: const Color(0xFF00ACC1), // Cyan aksen
              surface: Colors.white,
              onSurface: const Color(0xFF1C1B1F),
            ),
            scaffoldBackgroundColor: const Color(0xFFF8F9FA),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Color(0xFF1E88E5),
              foregroundColor: Colors.white,
            ),
            cardTheme: CardThemeData(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
            ),
          ),
          // 2. Tema Gelap (Dark Theme) dengan palet warna custom sendiri
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF90CAF9),
              brightness: Brightness.dark,
              primary: const Color(0xFF90CAF9), // Biru lembut untuk dark mode
              secondary: const Color(0xFF80CBC4), // Teal aksen
              surface: const Color(0xFF1E1E1E),
              onSurface: const Color(0xFFE2E2E6),
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Color(0xFF1E1E1E),
              foregroundColor: Colors.white,
            ),
            cardTheme: CardThemeData(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: const Color(0xFF1E1E1E),
            ),
          ),
          // Definisi Routes langsung menampilkan Halaman Profil utama
          initialRoute: '/',
          routes: {
            '/': (context) => ProfilePage(profile: defaultProfile),
            '/about': (context) => const AboutPage(),
          },
        );
      },
    );
  }
}
