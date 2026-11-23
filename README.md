# Ujian Tengah Semester (UTS) – Pemrograman Mobile (Flutter)

## 👤 Identitas Mahasiswa
- **Nama:** Ande Saputra
- **NIM:** 1124160121
- **Kelas:** TI24SE SH
- **Program Studi:** Software Engineering
- **Repository GitHub:** [https://github.com/1124160121-byte/uts-pml-1124160121.git](https://github.com/1124160121-byte/uts-pml-1124160121.git)

---

## 🎥 Link Video Demo YouTube
Tonton video demo aplikasi di YouTube melalui link berikut:  
🔗 **[Video Demo Aplikasi di YouTube](https://youtu.be/RhfNi2fFEPs?si=9EF4kJz65q5RsQ8x)**

---

## 📱 Screenshot Aplikasi (Minimal 3 Halaman)

Berikut adalah tampilan layar aplikasi pada Soal 2 (`soal2_profil_app`):

| 1. Halaman Login | 2. Halaman Profil | 3. Halaman Edit Profil |
| :---: | :---: | :---: |
| ![Login](soal2_profil_app/screenshots/login.png) | ![Profil](soal2_profil_app/screenshots/profil.png) | ![Edit Profil](soal2_profil_app/screenshots/edit_profil.png) |

> *Catatan: Letakkan file gambar tangkapan layar pada folder `soal2_profil_app/screenshots/` dengan nama file `login.png`, `profil.png`, dan `edit_profil.png`.*

---

## ✨ Daftar Fitur & Arsitektur
1. **Autentikasi / Login**: Form login dengan validasi input, indikator loading, dan navigasi `pushReplacement`.
2. **Halaman Profil**: Menampilkan data profil pengguna (nama, foto/avatar, email, kontak telepon, GitHub) dengan widget modular `InfoTile`.
3. **Scaffold Lengkap**: Dilengkapi dengan `drawer` (UserAccountsDrawerHeader + menu navigasi), `bottomNavigationBar`, dan `floatingActionButton`.
4. **Edit Profil**: Form validasi interaktif yang mengembalikan data hasil suntingan kembali ke halaman profil secara langsung via `setState()`.
5. **Halaman Tentang Saya**: Berisi ringkasan pengembang, daftar keahlian/hobi (dengan chip dan ikon), serta riwayat pendidikan.
6. **Tema Terang & Gelap (Light/Dark Theme)**: Palet warna custom dan switch mode tema langsung yang mengubah `themeMode` secara instan di AppBar dan Drawer.
7. **Identitas Aplikasi Android**: Konfigurasi `android:label="Profil Ande"` di `AndroidManifest.xml`.

---

## 💾 Manajemen Data & Dependensi Paket
- **Penyimpanan Data**: Data disimpan secara lokal di dalam **memori (in-memory state)** menggunakan mekanisme `StatefulWidget`, `setState()`, dan `Navigator.pop(context, updatedProfile)` antar layar tanpa memerlukan server atau database eksternal.
- **Paket Dependensi**: Proyek ini dibangun sepenuhnya menggunakan paket bawaan **Flutter SDK** (`flutter`) dan paket ikon bawaan **`cupertino_icons`**, tanpa dependensi pihak ketiga tambahan, sehingga ringan, stabil, dan kompatibel.

---

## 🚀 Cara Menjalankan Proyek

Pastikan Flutter SDK sudah terpasang di komputer Anda.

### 1. Clone Repository
```bash
git clone https://github.com/1124160121-byte/uts-pml-1124160121.git
cd uts-pml-1124160121
```

### 2. Menjalankan Soal 1 (`soal1_live_coding`)
```bash
cd soal1_live_coding
flutter pub get
flutter run
```

### 3. Menjalankan Soal 2 (`soal2_profil_app`)
```bash
cd soal2_profil_app
flutter pub get
flutter run
```

---

## 🛠️ Teknologi yang Digunakan
- **Framework:** Flutter
- **Bahasa:** Dart
