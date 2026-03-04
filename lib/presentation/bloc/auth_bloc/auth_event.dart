import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String userName;
  final String email;
  final String password;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.userName,
  });

  @override
  List<Object?> get props => [email, password, userName];
}

class SignOutEvent extends AuthEvent {}

class AuthCheckRequest extends AuthEvent {}
