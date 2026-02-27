import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(url: 'https://ihdtcuhkkvoyhundewcz.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImloZHRjdWhra3ZveWh1bmRld2N6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5MTczNzUsImV4cCI6MjA4NzQ5MzM3NX0.k9UCj3nGPy1p-ENdqEuQHU3B9QmkFKLQXsBtzC3QesM');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(),
    );
  }
}

