import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;

  const CustomTextFieldForm({
    super.key,
    required this.controller,
    required this.label,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label cannot be empty';
          }
          if (label == 'email' && !value.contains('@')) {
            return 'Enter a valid email';
          }
          if (label == 'password' && value.length < 6) {
            return 'password must be atleast 6 or more';
          }
          return null;
        },
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
