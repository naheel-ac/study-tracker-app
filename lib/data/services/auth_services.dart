import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final SupabaseClient client;

  AuthServices(this.client);

  Future<User?> signIn(String email, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user;
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> createProfile({
    required String id,
    required String email,
    required String userName,
  }) async {
    await client.from('profiles').upsert({
      'id': id,
      'email': email,
      'display_name': userName,
    });
  }

  Future<AuthResponse> signUp(
    String email,
    String password,
    String userName,
  ) async {
    try {
      return await client.auth.signUp(
        email: email,
        password: password,
        data: {'displayName': userName},
      );
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  User? getCurrentUser() {
    return client.auth.currentUser;
  }
}
