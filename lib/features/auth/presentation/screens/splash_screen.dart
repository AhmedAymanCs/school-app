import 'package:coureses_platform/core/constants/color_manager.dart';
import 'package:coureses_platform/core/theme/text_style.dart';
import 'package:coureses_platform/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const SignupScreen();
            },
          ),
        );
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
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text('Courses App', style: AppTextStyles.mains30bold),
              ),
              Text(
                'Empowering your learing journey with courses',
                style: AppTextStyles.mains20bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
