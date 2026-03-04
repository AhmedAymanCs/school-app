import 'package:coureses_platform/features/home/data/models/course_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<CourseModel> courses;
  HomeSuccessState({required this.courses});
}

class HomeErrorState extends HomeState {
  final String errmsg;
  HomeErrorState({required this.errmsg});
}
