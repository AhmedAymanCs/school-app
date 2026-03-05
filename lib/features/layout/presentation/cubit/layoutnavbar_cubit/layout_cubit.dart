import 'package:coureses_platform/core/constants/app_constants.dart';
import 'package:coureses_platform/features/home/presentation/screens/home.dart';
import 'package:coureses_platform/features/layout/presentation/cubit/layoutnavbar_cubit/layout_state.dart';
import 'package:coureses_platform/features/my_courses/presentation/my_courses_screen.dart';
import 'package:coureses_platform/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutCubit extends Cubit<LayoutBottomNavBarState> {
  LayoutCubit() : super(InitialBottomNavIndex());

  int currentIndex = 0;
  List<Widget> screens = [Home(), MyCoursesPage(), ProfilePage()];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndex());
  }

  Future<void> cacheHelper({
    required String key,
    String value = '',
    bool getCache = true,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (getCache && value.isEmpty) {
      prefs.getString(key);
    } else {
      await prefs.setString(key, value);
    }
  }

  void checkNewAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString(AppConstants.cacheIDKey);
    print('Auth ID: $id');
    await Future.delayed(const Duration(seconds: 2));
    if (id != null) {
      emit(AuthState(true));
    } else {
      emit(AuthState(false));
    }
  }
}
