import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:study_tracker/presentation/screens/auth_screen/Signin_screen/sign_in_screen.dart';
import 'package:study_tracker/presentation/widgets/bottom_nav_bar/btm_nav_bar.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is AuthAuthenticated) {
          return const BtmNavBar();
        }
        if (state is AuthUnauthenticated) {
          return const SignInScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
