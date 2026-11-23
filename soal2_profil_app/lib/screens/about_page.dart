import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Keahlian / Hobi (minimal 3)
    final List<Map<String, dynamic>> skillsAndHobbies = [
      {
        'title': 'Mobile Development (Flutter & Dart)',
        'type': 'Keahlian',
        'desc': 'baru belajar flutter',
        'icon': Icons.flutter_dash,
        'color': Colors.blue,
      },
      {
        'title': 'UI/UX Design',
        'type': 'Keahlian',
        'desc': 'Mendesain menggunakan Figma.',
        'icon': Icons.design_services,
        'color': Colors.orange,
      },
      {
        'title': 'Web Development',
        'type': 'Keahlian',
        'desc': 'Baru bisa PHP framework CI3,Laravel baru belajar',
        'icon': Icons.language,
        'color': Colors.teal,
      },
      {
        'title': 'Fotografi & Traveling',
        'type': 'Hobi',
        'desc':
            'jalan jalan,makan minum enak, ke pantai dan refresing lainnya.',
        'icon': Icons.camera_alt,
        'color': Colors.purple,
      },
      {
        'title': 'Membaca Dokumentasi Teknologi',
        'type': 'Hobi',
        'desc': 'Mengeksplorasi tren teknologi terbaru seperti AI.',
        'icon': Icons.menu_book,
        'color': Colors.indigo,
      },
    ];

    // Data Riwayat Pendidikan (minimal 3 jenjang)
    final List<Map<String, String>> educationList = [
      {
        'school': 'Universitas / Global Institute',
        'level': 'S1 Teknik Informatika (2024 - Sekarang)',
        'desc': 'Fokus mendalami Mobile Application, Rekayasa Perangkat Lunak, dan Basis Data.',
      },
      {
        'school': 'SMA / SMK Negeri',
        'level': 'Jurusan IPA / Rekayasa Perangkat Lunak (2021 - 2024)',
        'desc': 'Alhamdulillah Lulus Asli MAN.',
      },
      {
        'school': 'SMP / MTs Negeri',
        'level': 'Pendidikan Dasar Lanjutan (2018 - 2021)',
        'desc': 'Lulus dengan ketertarikan tinggi pada bidang teknologi komputer dan sains.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          // 1. Bagian Ringkasan Diri / Bio Singkat
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueAccent.shade100,
                    child: const Icon(
                      Icons.person_rounded,
                      size: 48,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Profil Mahasiswa & Pengembang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Seorang mahasiswa Teknik Informatika yang memiliki semangat tinggi dalam mempelajari ekosistem pengembangan aplikasi modern dengan Flutter.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 2. Bagian Daftar Keahlian / Hobi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Keahlian & Hobi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...skillsAndHobbies.map((item) {
            final color = item['color'] as Color;
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item['icon'] as IconData, color: color),
                ),
                title: Text(
                  item['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Text(
                      item['desc'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
                trailing: Chip(
                  label: Text(
                    item['type'] as String,
                    style: TextStyle(
                      color: color,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: color.withOpacity(0.1),
                  side: BorderSide(color: color.withOpacity(0.3)),
                  padding: const EdgeInsets.all(0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            );
          }),
          const SizedBox(height: 24),

          // 3. Bagian Riwayat Pendidikan
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Riwayat Pendidikan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...educationList.map((edu) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.account_balance_rounded,
                    color: Colors.blueAccent,
                  ),
                ),
                title: Text(
                  edu['school']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      edu['level']!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      edu['desc']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Alias kompatibilitas
typedef AboutScreen = AboutPage;
