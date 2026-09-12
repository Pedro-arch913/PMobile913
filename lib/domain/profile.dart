class Profile {
  String username;
  String email;
  String telephone;
  String avatarUrl;

  Profile({
    required this.username,
    required this.email,
    required this.telephone,
    this.avatarUrl = '',
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    // A API do Random User retorna uma lista: 'results'
    final user = json['results'][0];

    return Profile(
      username: user['login']['username'],
      email: user['email'],
      telephone: user['phone'],
      avatarUrl: user['picture']['large'],
    );
  }
}