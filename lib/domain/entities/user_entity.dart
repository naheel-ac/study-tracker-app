class UserEntity {
  final String id;
  final String? displayName;
  final String email;

  UserEntity({
    required this.id,
    this.displayName,
    required this.email
  });
}