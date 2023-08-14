import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/on_boarding_screen.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/navigator_key.dart';
import 'package:quran_app/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SizeConfig.init(NavigatorKey.navigatorKey.currentContext!);
    AppThemes.init(SizeConfig.textRatio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreen();
  }
}
