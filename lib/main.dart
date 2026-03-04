import 'package:coureses_platform/core/networking/supabase_services.dart';
import 'package:coureses_platform/core/routing/app_router.dart';
import 'package:coureses_platform/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupabaseServices.initSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Courses Platform',
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splashscreen,
    );
  }
}
