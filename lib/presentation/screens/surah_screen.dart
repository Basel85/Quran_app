import 'package:flutter/material.dart';
import 'package:quran_app/presentation/widgets/shared/column_located_on_the_first_body.dart';
import 'package:quran_app/presentation/widgets/shared/custom_app_bar.dart';
import 'package:quran_app/presentation/widgets/shared/custom_circluar_progress_indicator.dart';
import 'package:quran_app/presentation/widgets/shared/quran_meta_data_component.dart';
import 'package:quran_app/utils/size_config.dart';

class SurahScreen extends StatefulWidget {
  final int surahNumber;
  final String surahEnglishName;
  final String surahEnglishNameTranslation;
  final int numberOfAyahs;
  const SurahScreen(
      {super.key,
      required this.surahNumber,
      required this.surahEnglishName,
      required this.surahEnglishNameTranslation,
      required this.numberOfAyahs});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  void initState() {
    
    super.initState();
  }
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
        body: ColumnLocatedOnTheFirstBody(
          widgets: [
            SizedBox(
              height: 18 * SizeConfig.verticalBlock,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 32 * SizeConfig.horizontalBlock,
                  right: 35 * SizeConfig.horizontalBlock),
              child: QuranMetaDataComponent(
                surahEnglishName: widget.surahEnglishName,
                surahEnglishNameTranslation: widget.surahEnglishNameTranslation,
                numberOfAyahs: widget.numberOfAyahs,
                isHome: false,
              ),
            ),
            SizedBox(
              height: 18 * SizeConfig.verticalBlock,
            ),
            const Expanded(child: CustomCircularProgressIndicator())
          ],
        ));
  }
}
