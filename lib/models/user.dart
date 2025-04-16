class User {
  final String name;
  final String passwordHash;

  User({required this.name, required this.passwordHash});

  @override
  String toString() {
    return "$name, $passwordHash";
  }
}