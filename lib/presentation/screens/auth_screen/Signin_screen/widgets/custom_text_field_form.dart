import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final String text;

  const CustomTextFieldForm({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscure = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '$hintText cannot be empty';
              }
              if (hintText == 'email' && !value.contains('@')) {
                return 'Enter a valid email';
              }
              if (hintText == 'password' && value.length < 6) {
                return 'password must be atleast 6 or more';
              }
              return null;
            },
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              focusColor: Colors.white,
              hoverColor: Colors.white,
              filled: true,
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
