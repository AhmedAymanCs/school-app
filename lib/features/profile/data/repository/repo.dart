import 'package:coureses_platform/core/constants/app_constants.dart';
import 'package:coureses_platform/features/profile/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepo {
  final _supa = Supabase.instance.client;
  Future<Either<String, UserModel>> getProfile() async {
    try {
      final data = await _supa
          .from('users')
          .select('*')
          .eq('id', Supabase.instance.client.auth.currentUser!.id)
          .single();
      return Right(UserModel.fromJson(data));
    } catch (e) {
      return Left('Error ${e.toString()}');
    }
  }

  Future<Either<String, void>> logout() async {
    try {
      await _supa.auth.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(AppConstants.cacheIDKey);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
