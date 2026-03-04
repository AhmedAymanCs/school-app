import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  SupabaseClient supabase = Supabase.instance.client;
  Future<Either<String, String>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(res.user!.id);
    } on AuthApiException catch (e) {
      switch (e.statusCode) {
        case '400':
          return left('Invalid email or password');
        case '422':
          return left('Invalid email format');
        case '429':
          return left('Too many attempts, please try again later');
        case '500':
          return left('Server error, please try again');
        default:
          return left('Authentication error: ${e.statusCode}');
      }
    } on SocketException {
      return left('No internet connection');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      await saveUserData(name: name, email: email);
      return right(null);
    } on AuthApiException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> saveUserData({
    required String name,
    required String email,
  }) async {
    try {
      await supabase.from('users').insert({
        'id': supabase.auth.currentUser!.id,
        'name': name,
        'email': email,
      });
      return right(null);
    } on Exception catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}
