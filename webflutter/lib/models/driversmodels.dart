class User {
  final String name;

  const User({
    required this.name,
  });

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      name: map['name'] ?? '',
    );
  }
}
