abstract class LayoutBottomNavBarState {}

class ChangeBottomNavIndex extends LayoutBottomNavBarState {}

class InitialBottomNavIndex extends LayoutBottomNavBarState {}

class AuthState extends LayoutBottomNavBarState {
  final bool isAuth;
  AuthState(this.isAuth);
}
