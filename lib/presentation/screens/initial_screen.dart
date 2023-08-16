import 'package:flutter/material.dart';
import 'package:quran_app/bussiness_logic/auth/auth_cubit.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';
import 'package:quran_app/presentation/screens/on_boarding_screen.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/keys.dart';
import 'package:quran_app/utils/size_config.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    SizeConfig.init(Keys.navigatorKey.currentContext!);
    AppThemes.init(SizeConfig.textRatio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthCubit.get(context).authStateChanges(),
        builder: (_, snapShot) {
          if (snapShot.hasData) {
            return const HomeScreen(snapShot.data!.providerData[0]);
          } else {
            return const OnBoardingScreen();
          }
        });
  }
}
