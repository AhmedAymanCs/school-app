import 'package:coureses_platform/features/course_details/data/repo.dart';
import 'package:coureses_platform/features/course_details/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo _courseDetailsRepo;
  CourseDetailsCubit(this._courseDetailsRepo) : super(CourseDetailsInitial());
  bool isEnrolled = false;
  Future<void> enrollCourse({
    required String coursesId,
    required String usersId,
  }) async {
    emit(CourseEnrollmentLoading());

    final result = await _courseDetailsRepo.enrollCourses(
      coursesId: coursesId,
      usersId: usersId,
    );
    result.fold((error) => emit(CourseEnrollmentError(error)), (success) {
      isEnrolled = true;
      emit(CourseEnrollmentSuccess());
    });
  }

  Future<void> checkEnrollment({
    required String coursesId,
    required String usersId,
  }) async {
    emit(CourseEnrollmentLoading());
    isEnrolled = await _courseDetailsRepo.checkEnrollment(
      coursesId: coursesId,
      usersId: usersId,
    );
    emit(CourseDetailsInitial());
  }
}
