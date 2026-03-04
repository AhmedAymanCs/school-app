import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCoursesRepo {
  final id = Supabase.instance.client.auth.currentUser!.id;
  Future<Either<String, void>> getCourses() async {
    try {
      final res = await Supabase.instance.client
          .from('enrollments')
          .select('courses(*)')
          .eq('user_id', id);

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
