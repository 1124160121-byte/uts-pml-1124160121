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
// b. body tersusun: SafeArea -> SingleChildScrollView -> Padding -> Column (tidak boleh overflow di layar HP).
// c. Bagian kepala profil, rata tengah:
//    - CircleAvatar berisi inisial nama atau Icon(Icons.person).
//    - Nama lengkap, NIM, dan program studi dengan hierarki teks dari Theme.of(context).textTheme
// d. Gunakan SizedBox untuk jarak antarbagian yang konsisten.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                // d. Gunakan SizedBox untuk jarak antarbagian yang konsisten
                const SizedBox(height: 16),
                Text(
                  'Ande Saputra',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'NIM: 1124160121',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Program Studi Teknik Informatika',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Tahap 3 - b. Tampilkan Card Kontak berisi minimal 4 InfoTile: email, nomor HP, kelas, dan akun GitHub.
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: const [
                        InfoTile(
                          icon: Icons.email,
                          label: 'Email',
                          value: 'andesaputra94@gmail.com',
                        ),
                        Divider(height: 1),
                        InfoTile(
                          icon: Icons.phone,
                          label: 'Nomor HP',
                          value: '+62 812-3456-7890',
                        ),
                        Divider(height: 1),
                        InfoTile(
                          icon: Icons.school,
                          label: 'Kelas',
                          value: 'TI-24SE SH',
                        ),
                        Divider(height: 1),
                        InfoTile(
                          icon: Icons.code,
                          label: 'Akun GitHub',
                          value: 'github.com/1124160121-byte',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Tahap 3 - c. Tampilkan Card Keahlian/Hobi berisi minimal 3 InfoTile.
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: const [
                        InfoTile(
                          icon: Icons.computer,
                          label: 'Keahlian Utama',
                          value: 'Mobile App Development (Flutter & Dart)',
                        ),
                        Divider(height: 1),
                        InfoTile(
                          icon: Icons.sports_soccer,
                          label: 'Hobi Olahraga',
                          value: 'Futsal & Bulu Tangkis',
                        ),
                        Divider(height: 1),
                        InfoTile(
                          icon: Icons.music_note,
                          label: 'Minat & Hiburan',
                          value: 'Mendengarkan Musik & Membaca Buku',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Tahap 3 - Kartu Informasi dan Widget Reusable (Materi 5)
// a. Buat widget InfoTile (StatelessWidget) dengan konstruktor const dan parameter final: icon, label, value.
//    Isinya ListTile dengan leading: Icon(icon), title: Text(label), subtitle: Text(value).
class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
