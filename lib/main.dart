import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:study_tracker/data/repositories/auth_repository_impl.dart';
import 'package:study_tracker/data/services/auth_services.dart';
import 'package:study_tracker/domain/usecases/getcurrentuser.dart';
import 'package:study_tracker/domain/usecases/sign_in.dart';
import 'package:study_tracker/domain/usecases/sign_out.dart';
import 'package:study_tracker/domain/usecases/sign_up.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:study_tracker/presentation/screens/auth_screen/Signin_screen/sign_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env["SUPABASE_ANON_KEY"]!);

  final supabaseClient = Supabase.instance.client;
  final authServices = AuthServices(supabaseClient);
  final authRepositoryImpl = AuthRepositoryImpl(authServices);


  runApp(MyApp(
    getCurrentUserUseCase: GetCurrentUser(authRepositoryImpl),
    signInUseCase: SignIn(authRepositoryImpl),
    signUpUseCase: SignUp(authRepositoryImpl),
    signOutUseCase: SignOut(authRepositoryImpl),
  ));
}

class MyApp extends StatelessWidget {
  final GetCurrentUser getCurrentUserUseCase;
  final SignIn signInUseCase;
  final SignUp signUpUseCase;
  final SignOut signOutUseCase;
  const MyApp({super.key, required this.getCurrentUserUseCase, required this.signInUseCase, required this.signUpUseCase, required this.signOutUseCase
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => AuthBloc(getCurrentUserUseCase: getCurrentUserUseCase, signInUseCase: signInUseCase, signUpUseCase: signUpUseCase, signOutUseCase: signOutUseCase))
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    ));
  }
}
