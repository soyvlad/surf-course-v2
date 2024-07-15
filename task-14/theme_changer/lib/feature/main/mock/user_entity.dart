class UserEntity {
  UserEntity({
    required this.name,
    required this.email,
    required this.birthday,
    required this.team,
    required this.position,
  });

  final String name;
  final String email;
  final DateTime birthday;
  final String team;
  final String position;
}