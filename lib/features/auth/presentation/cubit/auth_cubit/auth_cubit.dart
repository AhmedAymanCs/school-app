import 'package:coureses_platform/core/constants/app_constants.dart';
import 'package:coureses_platform/features/auth/data/repo/auth_repo/auth_repo.dart';
import 'package:coureses_platform/features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitialState());

  Future<void> signin({required String email, required String password}) async {
    emit(LoginLoadingState());
    final res = await authRepo.signin(email: email, password: password);
    res.fold((error) => emit(LoginErrorState(errmsg: error.toString())), (
      id,
    ) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.cacheIDKey, id);
      emit(LoginSuccessState());
    });
  }

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoadingState());
    final res = await authRepo.signup(
      email: email,
      password: password,
      name: name,
    );
    res.fold(
      (error) => emit(SignupErrorState(errmsg: error.toString())),
      (success) => emit(SignupSuccessState()),
    );
  }
}
