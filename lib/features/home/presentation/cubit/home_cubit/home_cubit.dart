import 'package:coureses_platform/features/home/data/repo/home_repo.dart';
import 'package:coureses_platform/features/home/presentation/cubit/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  Future<void> getCourses() async {
    emit(HomeLoadingState());
    final res = await homeRepo.getAllCourses();
    res.fold(
      (error) {
        emit(HomeErrorState(errmsg: error));
      },
      (courses) {
        emit(HomeSuccessState(courses: courses));
      },
    );
  }
}
