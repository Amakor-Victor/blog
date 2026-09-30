class UserEntity {
  final int id;
  final String username;
  final String email;
  final String isActive;
  final String role;

  const UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.isActive,
    required this.role,
  });
}
