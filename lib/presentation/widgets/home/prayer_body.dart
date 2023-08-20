import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';
import 'package:table_calendar/table_calendar.dart';

class PrayerBody extends StatelessWidget {
  const PrayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 44 * SizeConfig.verticalBlock,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 32 * SizeConfig.horizontalBlock),
            decoration: const ShapeDecoration(
              color: AppThemes.color0xFFE5B6F2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: TableCalendar(

              calendarBuilders: const CalendarBuilders(),
              calendarStyle: CalendarStyle(
                
                cellMargin: EdgeInsets.symmetric(
                    horizontal: 20 * SizeConfig.horizontalBlock,
                    vertical: 13 * SizeConfig.verticalBlock),
                  weekendTextStyle:
                      AppThemes.color0xFF484848FontSize11FontWeightW500,
                  defaultTextStyle: AppThemes.pureBlackFontSize11FontWeightW500,
                  selectedTextStyle:
                      AppThemes.color0xFF300759FontSize11FontWeightW500,
                  outsideDaysVisible: false,
                  tablePadding: EdgeInsets.symmetric(
                      horizontal: 14 * SizeConfig.horizontalBlock),
                  weekNumberTextStyle:
                      AppThemes.color0xFF484848FontSize11FontWeightW500),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle:
                      AppThemes.color0xFF484848FontSize11FontWeightW500,
                  weekendStyle:
                      AppThemes.color0xFF484848FontSize11FontWeightW500),
              headerStyle: HeaderStyle(
                  titleTextFormatter: (date, locale) =>
                      DateFormat.yMMM(locale).format(date),
                  headerMargin: EdgeInsets.only(
                      top: 6 * SizeConfig.verticalBlock,
                      bottom: 16 * SizeConfig.verticalBlock),
                  leftChevronPadding: EdgeInsets.zero,
                  rightChevronPadding: EdgeInsets.zero,
                  leftChevronIcon: FaIcon(
                    FontAwesomeIcons.circleChevronLeft,
                    color: AppThemes.color0xFF484848,
                    size: 20 * SizeConfig.verticalBlock,
                  ),
                  rightChevronIcon: FaIcon(
                    FontAwesomeIcons.circleChevronRight,
                    color: AppThemes.color0xFF484848,
                    size: 20 * SizeConfig.verticalBlock,
                  ),
                  leftChevronMargin: EdgeInsets.only(
                      left: 86 * SizeConfig.horizontalBlock,
                      right: 15 * SizeConfig.horizontalBlock),
                  rightChevronMargin: EdgeInsets.only(
                      right: 85 * SizeConfig.horizontalBlock,
                      left: 15 * SizeConfig.horizontalBlock),
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle:
                      AppThemes.color0xFF484848FontSize18FontWeightW700),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(DateTime.now().year + 10, 10, 16),
              calendarFormat: CalendarFormat.month,
            ),
          ),
        ],
      ),
    );
  }
}
