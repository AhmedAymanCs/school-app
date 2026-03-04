abstract class AuthState{}

class AuthInitialState extends AuthState{}
class LoginLoadingState  extends AuthState{}
class LoginSuccessState  extends AuthState{}
class LoginErrorState  extends AuthState{
  final String errmsg;
  LoginErrorState({required this.errmsg});
}

class SignupLoadingState extends AuthState {}
class SignupSuccessState extends AuthState {}
class SignupErrorState extends AuthState {
  final String errmsg;
  SignupErrorState({required this.errmsg});
}
