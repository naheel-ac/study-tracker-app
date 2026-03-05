import 'package:flutter/material.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101122),
      body: Center(
        child: Text("focus", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
