import 'package:study_tracker/domain/entities/user_entity.dart';
import 'package:study_tracker/domain/repositories/auth_repository.dart';

class SignOut {
  final AuthRepository repository;
  SignOut(this.repository);

  Future<void>call()async{
    await repository.signOut();
  }
}