import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/features/profile/data/models/user_model.dart';
import 'package:coureses_platform/features/profile/data/repository/repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileState());

  Future<void> getProfile() async {
    emit(ProfileState(status: ProfileStatus.loading));
    final res = await _profileRepo.getProfile();
    res.fold(
      (l) => emit(ProfileState(status: ProfileStatus.error, error: l)),
      (r) => emit(ProfileState(status: ProfileStatus.success, user: r)),
    );
  }

  Future<void> logout(BuildContext context) async {
    emit(ProfileState(status: ProfileStatus.loading));
    final res = await _profileRepo.logout();
    res.fold(
      (error) => emit(ProfileState(status: ProfileStatus.error, error: error)),
      (_) {
        emit(ProfileState(status: ProfileStatus.logout));
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.loginscreen,
          (route) => false,
        );
      },
    );
  }
}
