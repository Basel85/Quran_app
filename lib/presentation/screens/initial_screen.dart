import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';
import 'package:quran_app/presentation/screens/on_boarding_screen.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/navigator_key.dart';
import 'package:quran_app/utils/size_config.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    SizeConfig.init(NavigatorKey.navigatorKey.currentContext!);
    AppThemes.init(SizeConfig.textRatio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder: (_,snapShot){
      if(snapShot.hasData){
        return const HomeScreen();
      }else{
        return const OnBoardingScreen();
      }
    });
  }
}
