import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/presentation/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:quran_app/presentation/cubits/bottom_navigation_bar/bottom_navigation_bar_states.dart';
import 'package:quran_app/presentation/screens/prayer_screen.dart';
import 'package:quran_app/presentation/screens/user_main_screen.dart';
import 'package:quran_app/presentation/widgets/shared/custom_bottom_navigation_bar_item_icon.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  final String? displayName;
  const HomeScreen({super.key, required this.displayName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        buildWhen: (previous, current) =>
            current is BottomNavigationBarIndexChangedState,
        builder: (_, state) => IndexedStack(
          index:
              state is BottomNavigationBarIndexChangedState ? state.index : 0,
          children: [
            UserMainScreen(displayName: widget.displayName!),
            const PrayerScreen()
          ],
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        buildWhen: (previous, current) =>
            current is BottomNavigationBarIndexChangedState,
        builder: (_, state) => BottomNavigationBar(
          currentIndex:
              state is BottomNavigationBarIndexChangedState ? state.index : 0,
          onTap: (index) {
            if (state is BottomNavigationBarIndexChangedState) {
              if (index != state.index) {
                BottomNavigationBarCubit.get(context).changeIndex(index);
              }
            } else {
              if (index != 0) {
                BottomNavigationBarCubit.get(context).changeIndex(index);
              }
            }
          },
          backgroundColor: AppThemes.color0xFFDAD0E1,
          elevation: 0,
          selectedIconTheme: IconThemeData(
              color: AppThemes.pureWhite, size: 35 * SizeConfig.verticalBlock),
          unselectedIconTheme: IconThemeData(
              color: AppThemes.color0xFF300759,
              size: 19.51 * SizeConfig.horizontalBlock),
          items: [
            BottomNavigationBarItem(
              icon: CustomBottomNavigationBarItemIcon(
                iconData: FontAwesomeIcons.bookQuran,
                isSelected: state is! BottomNavigationBarIndexChangedState ||
                        state.index == 0
                    ? true
                    : false,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: CustomBottomNavigationBarItemIcon(
                iconData: FontAwesomeIcons.mosque,
                isSelected: state is BottomNavigationBarIndexChangedState &&
                        state.index == 1
                    ? true
                    : false,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
