import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final bool isEmail;
  final bool isPassword;
  final String text;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscure = false,
    this.isEmail = false,
    this.isPassword = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: controller,
            obscureText: obscure,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$hintText cannot be empty';
              }
              if (isEmail && !EmailValidator.validate(value)) {
                return 'Enter valid email address';
              }
              if (isPassword && value.length < 6) {
                return 'Password must be at least 6 letter or more';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              focusColor: Colors.white,
              hoverColor: Colors.white,
              fillColor: const Color(0xFF1B1D3A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
