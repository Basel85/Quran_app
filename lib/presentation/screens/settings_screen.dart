import 'package:flutter/material.dart';
import 'package:quran_app/presentation/widgets/settings/settings_component.dart';
import 'package:quran_app/presentation/widgets/shared/custom_app_bar.dart';
import 'package:quran_app/utils/size_config.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Settings",
          actionsIcon: Icons.settings,
          isHome: false,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 29 * SizeConfig.verticalBlock,
            ),
            const SettingsComponent(settingsComponentName: "Account"),
            const SettingsComponent(settingsComponentName: "Notification"),
            const SettingsComponent(settingsComponentName: "Language"),
            const SettingsComponent(
                settingsComponentName: "Privacy & Security"),
            const SettingsComponent(settingsComponentName: "Help & Support"),
            const SettingsComponent(settingsComponentName: "About"),
          ],
        ));
  }
}
