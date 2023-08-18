import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/initial_screen.dart';
import 'package:quran_app/presentation/screens/login_screen.dart';
import 'package:quran_app/presentation/screens/notification_screen.dart';
import 'package:quran_app/presentation/screens/register_screen.dart';
import 'package:quran_app/presentation/screens/settings_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/notification':
        return MaterialPageRoute(builder: (_)=> const NotificationScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_)=> const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const InitialScreen());

    }
  }
}
