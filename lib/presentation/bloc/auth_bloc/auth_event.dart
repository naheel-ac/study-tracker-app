import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthEvent{
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}
class SignUpEvent extends AuthEvent{
  final String email;
  final String password;

  SignUpEvent({required this.email, required this.password});
}
class SignOutEvent extends AuthEvent{}
class AuthCheckRequest extends AuthEvent{}