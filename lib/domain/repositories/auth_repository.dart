import 'package:study_tracker/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signIn(String email, String password);

  Future<UserEntity?> signUp(String email, String password, String userName);

  Future<void> signOut();

  Future<UserEntity?> getCurrentUser();
}
