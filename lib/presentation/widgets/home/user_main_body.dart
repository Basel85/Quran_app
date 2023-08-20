import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class UserMainBody extends StatelessWidget {
  final String displayName;
  const UserMainBody({super.key, required this.displayName});

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
                length: 4,
                child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverPadding(
                            padding: EdgeInsets.only(
                                left: 32 * SizeConfig.horizontalBlock),
                            sliver: SliverToBoxAdapter(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(
                                    "Asalamu Alaikum !!!",
                                    style: AppThemes
                                        .color0xFF9D1DF2FontSize13FontWeightW700,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    displayName,
                                    style: AppThemes
                                        .color0xFF300759FontSize18FontWeightW700,
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
                                right: 34 * SizeConfig.horizontalBlock),
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
                                      Tab(text: "Para"),
                                      Tab(text: "Page"),
                                      Tab(text: "Hijb"),
                                    ],
                                    unselectedLabelStyle: AppThemes
                                        .color0xFF9D1DF2FontSize13FontWeightW500,
                                    labelStyle: AppThemes
                                        .color0xFF300759FontSize13FontWeightW700,
                                    labelColor: AppThemes.color0xFF300759,
                                    unselectedLabelColor:
                                        AppThemes.color0xFF9D1DF2,
                                    indicatorColor: AppThemes.color0xFF300759,
                                  )),
                            ),
                          )
                        ],
                    body: const TabBarView(
                      children: [
                        Text("Surah"),
                        Text("Para"),
                        Text("Page"),
                        Text("Hijb"),
                      ],
                    )),
              ),
            ),
          ],
        ),
    );
  }
}
