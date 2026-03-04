import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  SupabaseClient supabase = Supabase.instance.client;
  Future<Either<String, void>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(null);
    } on AuthApiException catch (e) {
      if (e.statusCode == 400) {
        return left('User not found or wrong password');
      }
      return left(" status code :${e.statusCode}");
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
