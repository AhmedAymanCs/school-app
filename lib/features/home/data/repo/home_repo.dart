import 'package:coureses_platform/core/models/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepo {
  //final SupabaseServices _supabaseServices = SupabaseServices();
  List<CourseModel> courses = [];
  Future<Either<String, List<CourseModel>>> getAllCourses() async {
    try {
      final res = await Supabase.instance.client.from('courses').select();
      for (var course in res) {
        courses.add(CourseModel.fromJson(course));
      }
      return Right(courses);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
