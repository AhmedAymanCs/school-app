abstract class CourseDetailsState {}

class CourseDetailsInitial extends CourseDetailsState {}

class CourseEnrollmentLoading extends CourseDetailsState {}

class CourseEnrollmentError extends CourseDetailsState {
  final String error;
  CourseEnrollmentError(this.error);
}

class CourseEnrollmentSuccess extends CourseDetailsState {}
