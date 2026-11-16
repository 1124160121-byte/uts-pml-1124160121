class UserProfile {
  String name;
  String email;
  String phone;
  String bio;
  String avatarUrl;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
    this.avatarUrl = '',
  });
}
