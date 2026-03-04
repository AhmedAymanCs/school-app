import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final supa = Supabase.instance.client;
  Future<Either<String, void>> enrollCourses({
    required String coursesId,
    required String usersId,
  }) async {
    if (await checkEnrollment(coursesId: coursesId, usersId: usersId)) {
      return Left('Already enrolled in this course');
    }
    try {
      await supa.from('enrollments').insert({
        'course_id': coursesId,
        'user_id': usersId,
      });
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<bool> checkEnrollment({
    required String coursesId,
    required String usersId,
  }) async {
    final res = await supa
        .from('enrollments')
        .select()
        .eq('course_id', coursesId)
        .eq('user_id', usersId);
    return res.isNotEmpty;
  }
}
