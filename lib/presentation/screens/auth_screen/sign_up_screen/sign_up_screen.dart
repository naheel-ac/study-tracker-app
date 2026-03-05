import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:study_tracker/presentation/screens/auth_screen/Signin_screen/sign_in_screen.dart';
import 'package:study_tracker/presentation/screens/auth_screen/sign_up_screen/widgets/custom_button.dart';
import 'package:study_tracker/presentation/screens/auth_screen/sign_up_screen/widgets/custom_text_form_field.dart';
import 'package:study_tracker/presentation/widgets/bottom_nav_bar/btm_nav_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushReplacement(
            context,
            PageTransition(type: PageTransitionType.fade, child: BtmNavBar()),
          );
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF101122),
        body: SafeArea(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                const Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  left: 25,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: 25,
                                        color: Colors.grey.withOpacity(0.9),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.asset('assets/mainIcon.png', width: 70),
                          const SizedBox(height: 30),
                          Text(
                            "Join Study-Tracker",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            "Stay your journey to academic \nsuccess",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          CustomTextFormField(
                            controller: _userNameController,
                            hintText: "User Name",
                            text: "Full Name",
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: _emailController,
                            hintText: "Email",
                            text: "Email",
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: _passwordController,
                            hintText: "Password",
                            text: "Password",
                            obscure: true,
                          ),
                          const SizedBox(height: 15),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return CustomButton(
                                onPressed: state is AuthLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthBloc>().add(
                                            SignUpEvent(
                                              email: _emailController.text
                                                  .trim(),
                                              password: _passwordController.text
                                                  .trim(),
                                              userName: _userNameController.text
                                                  .trim(),
                                            ),
                                          );
                                        }
                                      },
                                text: state is AuthLoading
                                    ? "Loading..."
                                    : "Sign Up",
                              );
                            },
                          ),
                          const SizedBox(height: 10),
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
                                  "OR SIGN UP WITH",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 12,
                                    letterSpacing: 1,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: SignInScreen(),
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  );
                                  ;
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color(0xFF6366F2),
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
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
