import 'package:coureses_platform/core/constants/color_manager.dart';
import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/core/theme/text_style.dart';
import 'package:coureses_platform/features/layout/presentation/cubit/layoutnavbar_cubit/layout_cubit.dart';
import 'package:coureses_platform/features/layout/presentation/cubit/layoutnavbar_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LayoutCubit()..checkNewAuth(),
      child: BlocListener<LayoutCubit, LayoutBottomNavBarState>(
        listener: (context, state) {
          if (state is AuthState) {
            if (state.isAuth) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.layout,
                (_) => false,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginscreen,
                (_) => false,
              );
            }
          }
        },

        child: Scaffold(
          backgroundColor: ColorManager.splashackgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.terminal_outlined,
                    color: ColorManager.maintextColor,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
