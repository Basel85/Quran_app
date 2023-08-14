import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';
import 'package:quran_app/presentation/screens/login_screen.dart';
import 'package:quran_app/presentation/screens/on_boarding_screen.dart';
import 'package:quran_app/presentation/screens/register_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/onBoardingScreen':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case '/loginscreen':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/registerscreen':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
