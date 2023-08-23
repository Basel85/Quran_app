import 'dart:convert';
import 'package:quran_app/constants/end_points.dart';
import 'package:quran_app/data/models/ayah_model.dart';
import 'package:quran_app/data/models/surah_model.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/utils/app_custom_exception.dart';

class SurahRequests {
  static const _surahsUrl = '${baseUrl}surah';
  static late Map<String, dynamic> _data;
  static Future<Map<String, dynamic>> _getTheData(String url) async{
    final response = await http.get(Uri.parse(_surahsUrl));
    return json.decode(response.body) as Map<String, dynamic>;
  }
  static Future<List<SurahModel>> getListOfSurahs() async {
    _data = await _getTheData(_surahsUrl) ;
    if (_data['code'] == 200) {
      final List<SurahModel> surahs = _data['data']
          .map((surah) => SurahModel.getListOfSurahFromJson(surah))
          .toList()
          .cast<SurahModel>();
      return surahs;
    } else {
      throw AppCustomException(_data['status']);
    }
  }

  static Future<List<AyahModel>> getSurahAyahs(int surahNumber) async {
    
  }
}
