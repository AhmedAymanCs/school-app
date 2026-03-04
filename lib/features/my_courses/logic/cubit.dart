import 'package:coureses_platform/core/models/course_model.dart';
import 'package:coureses_platform/features/my_courses/data/repo/repo.dart';
import 'package:coureses_platform/features/my_courses/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final MyCoursesRepo _myCoursesRepo;
  MyCoursesCubit(this._myCoursesRepo) : super(MyCoursesInitial());
  List<CourseModel> myCourses = [];

  Future<void> getMyCourses() async {
    emit(MyCoursesLoading());
    final res = await _myCoursesRepo.getCourses();
    res.fold(
      (error) => emit(MyCoursesError(error)),
      (success) => emit(MyCoursesSuccess()),
    );
  }
}
