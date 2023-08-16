import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app/bussiness_logic/auth/auth_cubit.dart';
import 'package:quran_app/bussiness_logic/my_bloc_observer.dart';
import 'package:quran_app/presentation/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/keys.dart';
import 'package:quran_app/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<PasswordVisibilityCubit>(
        create: (context) => PasswordVisibilityCubit(),
      ),
      BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
      ),
    ], child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Quran App',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: Keys.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: AppThemes.color0xFFDAD0E1,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
    );
  }
}
