class UserProfile {
  String name;
  String nim;
  String programStudi;
  String kelas;
  String bio;
  String email;
  String phone;
  String github;
  String imageAsset;

  UserProfile({
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
