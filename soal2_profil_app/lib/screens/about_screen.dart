import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
        'school': 'SMP Negeri',
        'level': 'Pendidikan Menengah Pertama (2018 - 2021)',
        'desc': 'Aktif Belajar dan tidak pernah Bolos.',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya'), centerTitle: true),
      // Ditampilkan menggunakan ListView
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          // Header Seksi 1: Keahlian & Hobi
          const Row(
            children: [
              Icon(Icons.star_rounded, color: Colors.amber, size: 28),
              SizedBox(width: 8),
              Text(
                'Keahlian & Hobi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Daftar Keahlian / Hobi dalam ListView
          ...skillsAndHobbies.map((item) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (item['color'] as Color).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    color: item['color'] as Color,
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item['title'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item['type'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    item['desc'] as String,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 20),
          const Divider(thickness: 1.2),
          const SizedBox(height: 16),

          // Header Seksi 2: Riwayat Pendidikan
          const Row(
            children: [
              Icon(Icons.school, color: Colors.blueAccent, size: 28),
              SizedBox(width: 8),
              Text(
                'Riwayat Pendidikan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Daftar Riwayat Pendidikan dalam ListView
          ...educationList.map((edu) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
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
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      edu['desc']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
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
