import 'package:flutter/material.dart';
import '../main.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile _currentProfile;
  int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentProfile = widget.profile;
  }

  // Fungsi navigasi ke Halaman Edit Profil & update data baru via setState()
  void _navigateToEditProfile() async {
    final updatedData = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: _currentProfile),
      ),
    );

    // Jika dataBaru dikembalikan dari Navigator.pop(context, dataBaru), perbarui state
    if (updatedData != null) {
      setState(() {
        _currentProfile = updatedData;
        _currentNavIndex = 0;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profil berhasil diperbarui!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      setState(() {
        _currentNavIndex = 0;
      });
    }
  }

  // Fungsi navigasi ke Halaman Tentang Saya
  void _navigateToAboutScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutPage(),
      ),
    );
    if (mounted) {
      setState(() {
        _currentNavIndex = 0;
      });
    }
  }

  void _onBottomNavTapped(int index) {
    if (index == 0) {
      setState(() {
        _currentNavIndex = 0;
      });
    } else if (index == 1) {
      setState(() {
        _currentNavIndex = 1;
      });
      _navigateToEditProfile();
    } else if (index == 2) {
      setState(() {
        _currentNavIndex = 2;
      });
      _navigateToAboutScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        actions: [
          // Tombol Mode Gelap / Terang langsung di AppBar
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeModeNotifier,
            builder: (context, currentMode, _) {
              final isDark = currentMode == ThemeMode.dark;
              return IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                tooltip: isDark ? 'Ubah ke Mode Terang' : 'Ubah ke Mode Gelap',
                onPressed: () {
                  themeModeNotifier.value =
                      isDark ? ThemeMode.light : ThemeMode.dark;
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Tentang Saya',
            onPressed: _navigateToAboutScreen,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
            onPressed: _navigateToEditProfile,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(_currentProfile.imageAsset),
                child: _currentProfile.imageAsset.isEmpty
                    ? const Icon(Icons.person, size: 40, color: Colors.grey)
                    : null,
              ),
              accountName: Text(
                _currentProfile.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              accountEmail: Text(_currentProfile.email),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                _navigateToEditProfile();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                _navigateToAboutScreen();
              },
            ),
            const Divider(),
            // Switch Mode Gelap di dalam Drawer
            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeModeNotifier,
              builder: (context, currentMode, _) {
                final isDark = currentMode == ThemeMode.dark;
                return SwitchListTile(
                  secondary: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                    color: isDark ? Colors.amber : Colors.blueAccent,
                  ),
                  title: const Text('Mode Gelap'),
                  subtitle: Text(
                    isDark ? 'Tema gelap aktif' : 'Tema terang aktif',
                    style: const TextStyle(fontSize: 12),
                  ),
                  value: isDark,
                  onChanged: (bool val) {
                    themeModeNotifier.value =
                        val ? ThemeMode.dark : ThemeMode.light;
                  },
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Keluar',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Foto diri dari folder assets/images/ dengan CircleAvatar
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueAccent.shade100,
                    child: CircleAvatar(
                      radius: 56,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: AssetImage(_currentProfile.imageAsset),
                      child: _currentProfile.imageAsset.isEmpty
                          ? const Icon(Icons.person, size: 60, color: Colors.grey)
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Nama lengkap
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                _currentProfile.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),

            // NIM, Program Studi, Kelas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '${_currentProfile.nim} • ${_currentProfile.programStudi} • ${_currentProfile.kelas}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Bio singkat
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _currentProfile.bio,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Divider(indent: 24, endIndent: 24),
            const SizedBox(height: 8),

            // Bagian Kontak memakai widget InfoTile (widgets/info_tile.dart)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      'Informasi Kontak',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // InfoTile Email
                  InfoTile(
                    icon: Icons.email_outlined,
                    iconColor: Colors.redAccent,
                    title: 'Email',
                    value: _currentProfile.email,
                  ),

                  // InfoTile Nomor HP
                  InfoTile(
                    icon: Icons.phone_outlined,
                    iconColor: Colors.green,
                    title: 'Nomor HP / WhatsApp',
                    value: _currentProfile.phone,
                  ),

                  // InfoTile GitHub
                  InfoTile(
                    icon: Icons.code_rounded,
                    iconColor: Colors.purple,
                    title: 'Akun GitHub',
                    value: _currentProfile.github,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Navigasi Halaman Edit Profil & Halaman Tentang Saya
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: _navigateToAboutScreen,
                      icon: const Icon(Icons.person_pin_rounded),
                      label: const Text(
                        'Lihat Halaman Tentang Saya',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: _navigateToEditProfile,
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text('Edit Profil'),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToEditProfile,
        tooltip: 'Edit Profil',
        child: const Icon(Icons.edit),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: _onBottomNavTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}

// Alias kompatibilitas
typedef ProfileScreen = ProfilePage;
