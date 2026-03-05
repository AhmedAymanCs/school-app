import 'package:coureses_platform/core/models/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCoursesRepo {
  final id = Supabase.instance.client.auth.currentUser!.id;
  List<CourseModel> courses = [];
  Future<Either<String, List<CourseModel>>> getCourses() async {
    try {
      final res = await Supabase.instance.client
          .from('enrollments')
          .select('courses(*)')
          .eq('user_id', id);
      final courses = res
          .map(
            (e) => CourseModel.fromJson(e['courses'] as Map<String, dynamic>),
          )
          .toList();

      return right(courses);
    } catch (e) {
      return left(e.toString());
    }
  }
}
