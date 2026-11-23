import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _kelasController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _githubController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan nilai awal dari profile saat ini
    _nameController = TextEditingController(text: widget.profile.name);
    _nimController = TextEditingController(text: widget.profile.nim);
    _prodiController = TextEditingController(text: widget.profile.programStudi);
    _kelasController = TextEditingController(text: widget.profile.kelas);
    _bioController = TextEditingController(text: widget.profile.bio);
    _emailController = TextEditingController(text: widget.profile.email);
    _phoneController = TextEditingController(text: widget.profile.phone);
    _githubController = TextEditingController(text: widget.profile.github);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Buat objek data baru dari form input
    final updatedProfile = Profile(
      name: _nameController.text.trim(),
      nim: _nimController.text.trim(),
      programStudi: _prodiController.text.trim(),
      kelas: _kelasController.text.trim(),
      bio: _bioController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      github: _githubController.text.trim(),
      imageAsset: widget.profile.imageAsset,
    );

    // Kembali ke Halaman Profil dengan Navigator.pop membawa data baru
    Navigator.pop(context, updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Field Nama Lengkap (Wajib diisi)
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap *',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama lengkap wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Field Email (Validasi format email)
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email *',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email wajib diisi';
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Field Nomor HP (Hanya angka, panjang 10-13 digit)
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Nomor HP *',
                  hintText: 'Contoh: 081234567890',
                  prefixIcon: Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nomor HP wajib diisi';
                  }
                  final phoneTrim = value.trim();
                  if (!RegExp(r'^[0-9]+$').hasMatch(phoneTrim)) {
                    return 'Nomor HP hanya boleh berisi angka';
                  }
                  if (phoneTrim.length < 10 || phoneTrim.length > 13) {
                    return 'Nomor HP harus berjumlah 10 - 13 digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Field Akun GitHub
              TextFormField(
                controller: _githubController,
                decoration: const InputDecoration(
                  labelText: 'Akun GitHub',
                  prefixIcon: Icon(Icons.code),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Field NIM
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  prefixIcon: Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Field Program Studi
              TextFormField(
                controller: _prodiController,
                decoration: const InputDecoration(
                  labelText: 'Program Studi',
                  prefixIcon: Icon(Icons.school_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Field Kelas
              TextFormField(
                controller: _kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  prefixIcon: Icon(Icons.class_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Field Bio Singkat
              TextFormField(
                controller: _bioController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Bio Singkat',
                  prefixIcon: Icon(Icons.info_outline),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Simpan
              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Alias kompatibilitas
typedef EditProfileScreen = EditProfilePage;
