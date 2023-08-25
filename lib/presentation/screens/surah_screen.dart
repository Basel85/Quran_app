import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/surah/surah_cubit.dart';
import 'package:quran_app/bussiness_logic/surah/surah_states.dart';
import 'package:quran_app/bussiness_logic/ayah_selection/ayah_selection_cubit.dart';
import 'package:quran_app/bussiness_logic/ayah_selection/ayah_selection_states.dart';
import 'package:quran_app/presentation/widgets/shared/api_error_message_component.dart';
import 'package:quran_app/presentation/widgets/shared/column_located_on_the_first_body.dart';
import 'package:quran_app/presentation/widgets/shared/custom_app_bar.dart';
import 'package:quran_app/presentation/widgets/shared/custom_circluar_progress_indicator.dart';
import 'package:quran_app/presentation/widgets/shared/custom_refresh_indicator.dart';
import 'package:quran_app/presentation/widgets/shared/quran_meta_data_component.dart';
import 'package:quran_app/utils/app_themes.dart';
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
    SurahCubit.get(context).getSurahAyahs(surahNumber: widget.surahNumber);
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
            Expanded(
              child: BlocBuilder<SurahCubit, SurahState>(
                buildWhen: (previous, current) =>
                    current is SurahGetSurahAyahsLoadingState ||
                    current is SurahGetSurahAyahsSuccessState ||
                    current is SurahGetSurahAyahsErrorState,
                builder: (_, state) {
                  if (state is SurahGetSurahAyahsSuccessState) {
                    return CustomRefreshIndicator(
                      paddingLeft: 6 * SizeConfig.horizontalBlock,
                      paddingRight: 25 * SizeConfig.horizontalBlock,
                      onRefresh: () => SurahCubit.get(context)
                          .getSurahAyahs(surahNumber: widget.surahNumber),
                      itemBuilder: (_, index) => BlocBuilder<AyahSelectionCubit,AyahSelectionState>(
                        builder:(_,ayahSelectionState)=> Container(
                          color: AppThemes.pureWhite,
                          margin: EdgeInsets.only(
                              bottom: 39 * SizeConfig.verticalBlock),
                          child: Text(
                            state.surahAyahs[index].ayahText,
                            style: AppThemes
                                .fontFamilyPoppinsColor0xFF300759FontSize24FontWeightW400,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                      itemCount: state.surahAyahs.length,
                    );
                  } else if (state is SurahGetSurahAyahsErrorState) {
                    return ApiErrorMessageComponent(
                      errorMessage: state.errorMessage,
                      onTap: () => SurahCubit.get(context)
                          .getSurahAyahs(surahNumber: widget.surahNumber),
                    );
                  } else {
                    return const CustomCircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ));
  }
}
