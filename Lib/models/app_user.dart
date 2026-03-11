class AppUser {
  final String name;
  final String password;
  final String role; // "admin" | "user"
  int score;
  List<String> logins;

  AppUser({
    required this.name,
    required this.password,
    required this.role,
    this.score = 0,
    List<String>? logins,
  }) : logins = logins ?? [];

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      name: (json['name'] ?? '').toString(),
      password: (json['password'] ?? '').toString(),
      role: (json['role'] ?? 'user').toString(),
      score: (json['score'] is int)
          ? json['score'] as int
          : int.tryParse(json['score']?.toString() ?? '0') ?? 0,
      logins: (json['logins'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'role': role,
        'score': score,
        'logins': logins,
      };
}