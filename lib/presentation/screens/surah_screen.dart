import 'package:flutter/material.dart';
import 'package:quran_app/presentation/widgets/shared/custom_app_bar.dart';
import 'package:quran_app/presentation/widgets/shared/custom_circluar_progress_indicator.dart';
import 'package:quran_app/utils/size_config.dart';

class SurahScreen extends StatelessWidget {
  final int surahNumber;
  const SurahScreen({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(92 * SizeConfig.verticalBlock),
        child: const CustomAppBar(
          title: "Surah",
          isHome: false,
        ),
      ),
      body: const CustomCircularProgressIndicator(),
    );
  }
}
