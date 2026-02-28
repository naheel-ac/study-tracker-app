import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state){
        if(state is AuthAuthenticated){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
        }if(state is AuthError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to Login")));
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF101122),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state){
            return SafeArea(child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaY: 15,
                      sigmaX: 15
                  ),
                  child: Container(
                    height: double.infinity,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1.1,
                            color: Colors.white.withOpacity(0.5)
                        )
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 80,
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Text("Sign In", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                              ),),
                              Positioned(
                                  left: 16,
                                  child: Icon(Icons.arrow_back, color: Colors.grey.withOpacity(0.9),))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
