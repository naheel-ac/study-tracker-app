import 'package:study_tracker/data/models/user_model/user_model.dart';
import 'package:study_tracker/data/services/auth_services.dart';
import 'package:study_tracker/domain/entities/user_entity.dart';
import 'package:study_tracker/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthServices services;

  AuthRepositoryImpl(this.services);

  @override
  Future<UserEntity?> getCurrentUser() async{
    final user = await services.getCurrentUser();
    if(user == null) return null;

    final model = UserModel(id: user.id, displayName: user.userMetadata?['displayName'], email: user.email ?? '');

    return model.toEntity();
  }

  @override
  Future<UserEntity?> signIn(String email, String password) async{
    final user = await services.signIn(email, password);
    if(user == null) return null;
    final model = UserModel(id: user.id, displayName: user.userMetadata?['displayName'], email: user.email ?? '');

    return model.toEntity();
  }

  @override
  Future<void> signOut()async {
    await services.signOut();
  }

  @override
  Future<UserEntity?> signUp(String email, String password) async{
    final user = await services.signUp(email, password);
    if(user == null) return null;

    await services.createProfile(id: user.id, email: user.email ?? '');
    final model =  UserModel(id: user.id, email: user.email ?? '');

    return model.toEntity();
  }
}