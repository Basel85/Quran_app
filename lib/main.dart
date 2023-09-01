import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app/business_logic/cubits/auth/auth_cubit.dart';
import 'package:quran_app/business_logic/cubits/last_read/last_read_cubit.dart';
import 'package:quran_app/business_logic/cubits/my_bloc_observer.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_cubit.dart';
import 'package:quran_app/business_logic/cubits/ayah_selection/ayah_selection_cubit.dart';
import 'package:quran_app/presentation/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:quran_app/presentation/cubits/calendar/calendar_cubit.dart';
import 'package:quran_app/presentation/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/keys.dart';
import 'package:quran_app/utils/route_generator.dart';
import 'package:quran_app/utils/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<PasswordVisibilityCubit>(
      create: (context) => PasswordVisibilityCubit(),
    ),
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
    ),
    BlocProvider<BottomNavigationBarCubit>(
        create: (context) => BottomNavigationBarCubit()),
    BlocProvider<CalendarCubit>(create: (context) => CalendarCubit()),
    BlocProvider<SurahCubit>(
      create: (context) => SurahCubit(),
    ),
    BlocProvider<AyahSelectionCubit>(create: (context)=>AyahSelectionCubit()),
    BlocProvider<LastReadCubit>(create: ((context) => LastReadCubit()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    AppThemes.init(SizeConfig.textRatio);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Quran App',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: Keys.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: AppThemes.color0xFFDAD0E1,
        useMaterial3: true
      ),
      initialRoute: '/',
    );
  }
}
