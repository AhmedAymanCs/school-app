import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/features/auth/presentation/screens/login_screen.dart';
import 'package:coureses_platform/features/auth/presentation/screens/signup_screen.dart';
import 'package:coureses_platform/features/layout/presentation/screens/splash_screen.dart';
import 'package:coureses_platform/features/course_details/presentation/screens/course_details.dart';
import 'package:coureses_platform/core/models/course_model.dart';
import 'package:coureses_platform/features/home/presentation/screens/home.dart';
import 'package:coureses_platform/features/layout/presentation/screens/layout_bottom_navbar.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signupscreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const LayoutBottomNavbar());
      case Routes.homescreen:
        return MaterialPageRoute(builder: (_) => const Home());
      case Routes.coursedetails:
        final course = settings.arguments as CourseModel;
        return MaterialPageRoute(builder: (_) => CourseDetails(course: course));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
