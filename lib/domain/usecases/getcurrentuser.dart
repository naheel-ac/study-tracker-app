import 'package:study_tracker/domain/entities/user_entity.dart';
import 'package:study_tracker/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;
  GetCurrentUser(this.repository);

  Future <UserEntity?> call(){
    return  repository.getCurrentUser();
  }
}
