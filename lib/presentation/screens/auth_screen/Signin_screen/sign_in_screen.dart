import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:study_tracker/presentation/screens/auth_screen/Signin_screen/widgets/custom_text_button.dart';
import 'package:study_tracker/presentation/screens/auth_screen/Signin_screen/widgets/custom_text_field_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Bloc listener
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Login Successful")));
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Failed to Login")));
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF101122),
        //bloc builder
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.95,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1.1,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      child: SingleChildScrollView(
                        //Form
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 80,
                                width: double.infinity,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Positioned(
                                      left: 25,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.grey.withOpacity(0.9),
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              //App Logo image
                              Image.asset('assets/mainIcon.png', width: 70),
                              const SizedBox(height: 30),
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                "Stay focused and achieve your goals",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 70),
                              //Email form
                              CustomTextFieldForm(
                                controller: _emaiController,
                                label: "email",
                              ),
                              const SizedBox(height: 30),
                              //Password Form
                              CustomTextFieldForm(
                                controller: _passwordController,
                                label: "password",
                                obscure: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  //Forgot password button
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot?",
                                      style: TextStyle(
                                        color: Color(0xFF6366F2),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              //Sign in Elevated button
                              CustomTextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                      SignInEvent(
                                        email: _emaiController.text.trim(),
                                        password: _passwordController.text
                                            .trim(),
                                      ),
                                    );
                                  }
                                },
                                text: "Sign In",
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xff323367),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      "OR CONTINUE WITH",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xff323367),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emaiController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
