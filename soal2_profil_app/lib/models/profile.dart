class Profile {
  String name;
  String nim;
  String programStudi;
  String kelas;
  String bio;
  String email;
  String phone;
  String github;
  String imageAsset;

  // Getter dan Setter alias agar sesuai soal (# class Profile (nama, nim, prodi, email, hp, ...))
  String get nama => name;
  set nama(String val) => name = val;

  String get prodi => programStudi;
  set prodi(String val) => programStudi = val;

  String get hp => phone;
  set hp(String val) => phone = val;

  Profile({
    required this.name,
    required this.nim,
    required this.programStudi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.phone,
    required this.github,
    this.imageAsset = 'assets/images/profile.jpg',
  });
}

// Alias kompatibilitas
typedef UserProfile = Profile;
