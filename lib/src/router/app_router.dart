import 'package:flutter/material.dart';
import '../ui/view/auth/login/login_view.dart';
import '../ui/view/auth/sign_up/sign_up.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
    }
  }
}
