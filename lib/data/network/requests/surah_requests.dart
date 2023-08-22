import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/constants/end_points.dart';
import 'package:quran_app/data/models/surah_model.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/utils/app_custom_exception.dart';

class SurahRequests {
  static const surahsUrl = '${baseUrl}surah';
  static Future<List<SurahModel>> getListOfSurahs() async {
    final response = await http.get(Uri.parse(surahsUrl));
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data['code'] == 200) {
      final List<SurahModel> surahs = data['data']
          .map((surah) {
            debugPrint(surah.toString());
            return SurahModel.getListOfSurahFromJson(surah);
          })
          .toList()
          .cast<SurahModel>();
      return surahs;
    } else {
      throw AppCustomException(data['status']);
    }
  }
}
