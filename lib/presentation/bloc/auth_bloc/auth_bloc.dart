import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_tracker/domain/usecases/sign_in.dart';
import 'package:study_tracker/domain/usecases/sign_out.dart';
import 'package:study_tracker/domain/usecases/sign_up.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_state.dart';

import '../../../domain/usecases/getcurrentuser.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser getCurrentUserUseCase;
  final SignIn signInUseCase;
  final SignUp signUpUseCase;
  final SignOut signOutUseCase;

  AuthBloc({
    required this.getCurrentUserUseCase,
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial()) {
    on<AuthCheckRequest>(_onAuthCheckRequest);
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
  }

  //Check Existing Session
  Future<void> _onAuthCheckRequest(
    AuthCheckRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await getCurrentUserUseCase();

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: 'Something went wrong'));
    }
  }

  //Sing In
  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signInUseCase(event.email, event.password);

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  //Sign Up
  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signUpUseCase(
        event.email,
        event.password,
        event.userName,
      );

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  //Sign Out
  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await signOutUseCase();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
