import 'package:study_tracker/domain/entities/user_entity.dart';
import 'package:study_tracker/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<UserEntity?> call(String email, String password){
    return repository.signUp(email, password);
  }
  }