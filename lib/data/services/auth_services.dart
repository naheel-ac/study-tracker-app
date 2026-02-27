import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final SupabaseClient client;

  AuthServices(this.client);

  Future<User?>signIn(String email, String password)async{
    try{
      final response = await client.auth.signInWithPassword(
          email: email, password: password);
      return response.user;
    }on AuthException catch(e){
      throw Exception(e.message);
    }
  }

  Future<void>createProfile({
    required String id,
    required String email
  })async{
    await client.from('profiles').insert({
      'id': id,
      'email': email
    });
  }

  Future<User?>signUp(String email, String password) async{
    try{
      final response = await client.auth.signUp(
          email: email, password: password);
      return response.user;
    }catch(e){
      throw Exception('failed to login');
    }
  }

  Future<void>signOut()async{
    await client.auth.signOut();
  }
  User? getCurrentUser(){
    return client.auth.currentUser;
  }
}