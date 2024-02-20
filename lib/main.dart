import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:go_router/go_router.dart';

import 'package:twitter/feature/auth/view/login_view.dart';
import 'package:twitter/feature/auth/view/signup_view.dart';
import 'package:twitter/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupView(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Twitter',
      theme: AppTheme.theme,
      routerConfig: _router,
    );
  }
}
