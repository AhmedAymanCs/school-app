abstract class MyCoursesState {}

class MyCoursesInitial extends MyCoursesState {}

class MyCoursesLoading extends MyCoursesState {}

class MyCoursesError extends MyCoursesState {
  final String error;
  MyCoursesError(this.error);
}

class MyCoursesSuccess extends MyCoursesState {
  MyCoursesSuccess();
}
