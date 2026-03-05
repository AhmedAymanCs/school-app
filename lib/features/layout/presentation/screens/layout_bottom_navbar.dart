import 'package:coureses_platform/core/constants/color_manager.dart';
import 'package:coureses_platform/features/layout/presentation/cubit/layoutnavbar_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/layoutnavbar_cubit/layout_cubit.dart';

class LayoutBottomNavbar extends StatelessWidget {
  const LayoutBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LayoutCubit();
      },
      child: BlocBuilder<LayoutCubit, LayoutBottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: context
                  .read<LayoutCubit>()
                  .screens[context.read<LayoutCubit>().currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: context.read<LayoutCubit>().currentIndex,
              onTap: (index) {
                context.read<LayoutCubit>().changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'My Courses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: ColorManager.white,
              unselectedItemColor: ColorManager.maintextColor,
              selectedIconTheme: IconThemeData(size: 26),
              unselectedIconTheme: IconThemeData(size: 24),
              selectedLabelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorManager.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
