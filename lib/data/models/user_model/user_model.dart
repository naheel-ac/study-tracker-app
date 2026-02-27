import 'package:study_tracker/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String? displayName;
  final String email;

  UserModel({
    required this.id,
    this.displayName,
    required this.email
});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        id: json['id'],
        displayName: json['displayName'],
        email: json['email']);
  }
  UserEntity toEntity(){
    return UserEntity(id: id,
        displayName: displayName,
        email: email);
  }
}