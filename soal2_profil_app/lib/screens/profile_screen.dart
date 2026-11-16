import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class ProfileScreen extends StatefulWidget {
  final UserProfile profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfile _currentProfile;

  @override
  void initState() {
    super.initState();
    _currentProfile = widget.profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Bio singkat dalam kontainer rapi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _currentProfile.bio,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Divider(indent: 24, endIndent: 24),
            const SizedBox(height: 8),

            // Bagian Kontak memakai Card + ListTile dengan ikon
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

                  // Card Email
                  Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.email_outlined, color: Colors.redAccent),
                      ),
                      title: const Text(
                        'Email',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      subtitle: Text(
                        _currentProfile.email,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Card Nomor HP
                  Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.phone_outlined, color: Colors.green),
                      ),
                      title: const Text(
                        'Nomor HP / WhatsApp',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      subtitle: Text(
                        _currentProfile.phone,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Card Akun GitHub
                  Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.code_rounded, color: Colors.purple),
                      ),
                      title: const Text(
                        'Akun GitHub',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      subtitle: Text(
                        _currentProfile.github,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
