import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env["SUPABASE_ANON_KEY"]!);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => AuthBloc(getCurrentUserUseCase: getCurrentUserUseCase, signInUseCase: signInUseCase, signUpUseCase: signUpUseCase, signOutUseCase: signOutUseCase))
    ], child: MaterialApp());
  }
}
