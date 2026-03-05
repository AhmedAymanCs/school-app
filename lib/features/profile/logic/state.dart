part of 'cubit.dart';

enum ProfileStatus { initial, loading, success, error, logout }

class ProfileState {
  final ProfileStatus status;
  final String error;
  final UserModel? user;
  ProfileState({
    this.status = ProfileStatus.initial,
    this.error = '',
    this.user,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    String? error,
    UserModel? user,
  }) {
    return ProfileState(
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}
