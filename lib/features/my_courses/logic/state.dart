import 'package:coureses_platform/core/models/course_model.dart';

abstract class MyCoursesState {}

class MyCoursesInitial extends MyCoursesState {}

class MyCoursesLoading extends MyCoursesState {}

class MyCoursesError extends MyCoursesState {
  final String error;
  MyCoursesError(this.error);
}

class MyCoursesSuccess extends MyCoursesState {
  final List<CourseModel> myCourses;
  MyCoursesSuccess(this.myCourses);
}
