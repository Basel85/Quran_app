import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/surah/surah_cubit.dart';
import 'package:quran_app/bussiness_logic/surah/surah_states.dart';
import 'package:quran_app/presentation/widgets/shared/custom_circluar_progress_indicator.dart';
import 'package:quran_app/presentation/widgets/shared/quran_meta_data_component.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class UserMainBody extends StatefulWidget {
  final String displayName;
  const UserMainBody({super.key, required this.displayName});

  @override
  State<UserMainBody> createState() => _UserMainBodyState();
}

class _UserMainBodyState extends State<UserMainBody> {
  @override
  initState() {
    super.initState();
    SurahCubit.get(context).getListOfSurahs();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35 * SizeConfig.verticalBlock,
          ),
          Expanded(
            child: DefaultTabController(
              length: 1,
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        SliverPadding(
                          padding: EdgeInsets.only(
                              left: 32 * SizeConfig.horizontalBlock),
                          sliver: SliverToBoxAdapter(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Asalamu Alaikum !!!",
                                  style: AppThemes
                                      .fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW700,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  widget.displayName,
                                  style: AppThemes
                                      .fontFamilyPoppinsColor0xFF300759FontSize18FontWeightW700,
                                  textAlign: TextAlign.center,
                                )
                              ])),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 29 * SizeConfig.verticalBlock,
                          ),
                        ),
                        // SliverToBoxAdapter(
                        //   child: Container(
                        //     padding: EdgeInsets.only(
                        //         left: 21 * SizeConfig.horizontalBlock,
                        //         right: 18 * SizeConfig.horizontalBlock),
                        //     decoration: ShapeDecoration(
                        //       color: AppThemes.color0xFFE5B6F2,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SliverPadding(
                          padding: EdgeInsets.only(
                              left: 35 * SizeConfig.horizontalBlock,
                              right: 33 * SizeConfig.horizontalBlock),
                          sliver: SliverAppBar(
                            pinned: true,
                            floating: false,
                            elevation: 0.0,
                            expandedHeight: 0,
                            backgroundColor: AppThemes.color0xFFDAD0E1,
                            automaticallyImplyLeading: false,
                            shape: Border(
                                bottom: BorderSide(
                                    color: AppThemes.color0xFF9D1DF2
                                        .withOpacity(0.1))),
                            bottom: PreferredSize(
                                preferredSize: const Size.fromHeight(0.0),
                                child: TabBar(
                                  tabs: const [
                                    Tab(text: "Surah"),
                                    // Tab(text: "Para"),
                                    // Tab(text: "Page"),
                                    // Tab(text: "Hijb"),
                                  ],
                                  unselectedLabelStyle: AppThemes
                                      .fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW500,
                                  labelStyle: AppThemes
                                      .fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW700,
                                  labelColor: AppThemes.color0xFF300759,
                                  unselectedLabelColor:
                                      AppThemes.color0xFF9D1DF2,
                                  indicatorColor: AppThemes.color0xFF300759,
                                )),
                          ),
                        )
                      ],
                  body: Container(
                    margin: EdgeInsets.only(
                        left: 35 * SizeConfig.horizontalBlock,
                        right: 33 * SizeConfig.horizontalBlock),
                    padding:
                        EdgeInsets.only(top: 12 * SizeConfig.verticalBlock),
                    child: TabBarView(
                      children: [
                        BlocBuilder<SurahCubit, SurahState>(
                            buildWhen: (previous, current) =>
                                current is SurahLoadingState ||
                                current is SurahSuccessState ||
                                current is SurahErrorState,
                            builder: (_, state) {
                              if (state is SurahSuccessState) {
                                return RefreshIndicator(
                                  backgroundColor: AppThemes.color0xFFDAD0E1,
                                  color: AppThemes.color0xFF300759,
                                  strokeWidth: 2 * SizeConfig.horizontalBlock,
                                  displacement: 40 * SizeConfig.verticalBlock,
                                  onRefresh: () =>
                                      SurahCubit.get(context).getListOfSurahs(),
                                  child: ListView.builder(
                                    itemBuilder: (_, index) => GestureDetector(
                                      onTap: () => Navigator.pushNamed(
                                          context, '/surah',
                                          arguments: {
                                            "surahNumber": state
                                                .surahs[index].surahNumber,
                                            "surahEnglishName": state
                                                .surahs[index]
                                                .surahEnglishName,
                                            "surahEnglishNameTranslation": state.surahs[index].surahEnglishNameTranslation,
                                            "numberOfAyahs": state
                                                .surahs[index].numberOfAyahs,
                                          }),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 43 *
                                                  SizeConfig.horizontalBlock,
                                              right: 10 *
                                                  SizeConfig.horizontalBlock,
                                              top:
                                                  12 * SizeConfig.verticalBlock,
                                              bottom: 20 *
                                                  SizeConfig.verticalBlock),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: AppThemes
                                                          .color0xFF9D1DF2
                                                          .withOpacity(0.1),
                                                      width: 1 *
                                                          SizeConfig
                                                              .textRatio))),
                                          child: QuranMetaDataComponent(
                                            surahEnglishName: state
                                                .surahs[index].surahEnglishName,
                                            surahEnglishNameTranslation: state
                                                .surahs[index]
                                                .surahEnglishNameTranslation,
                                            numberOfAyahs: state
                                                .surahs[index].numberOfAyahs,
                                            trailing: Text(
                                              state.surahs[index].surahName,
                                              textAlign: TextAlign.center,
                                              style: AppThemes
                                                  .fontFamilyLateefColor0xFF300759FontSize24FontWeightW400,
                                            ),
                                          )),
                                    ),
                                    itemCount: state.surahs.length,
                                  ),
                                );
                              } else if (state is SurahErrorState) {
                                return Center(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${state.errorMessage}\n",
                                          style: AppThemes
                                              .fontFamilyPoppinsColor0xFF300759FontSize14FontWeightW700,
                                        ),
                                        TextSpan(
                                          text: "Tap to reload",
                                          style: AppThemes
                                              .fontFamilyPoppinsColor0xFF0E17F6FontSize13FontWeightW700,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                SurahCubit.get(context)
                                                    .getListOfSurahs(),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              } else {
                                return const CustomCircularProgressIndicator();
                              }
                            })

                        // const Text("Para"),
                        // const Text("Page"),
                        // const Text("Hijb"),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
