import 'package:coureses_platform/features/home/data/models/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepo {
  //final SupabaseServices _supabaseServices = SupabaseServices();
  List<CourseModel> courses = [];
  Future<Either<String, List<CourseModel>>> getAllCourses() async {
    print('Fetching all courses...');
    try {
      final res = await Supabase.instance.client.from('courses').select();
      print('Course data: $res');
      for (var course in res) {
        print('Course data: $course');
        courses.add(CourseModel.fromJson(course));
      }
      return Right(courses);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
