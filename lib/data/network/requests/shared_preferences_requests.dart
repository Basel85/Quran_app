import 'package:quran_app/data/data_providers/local/shared_preferences_helper.dart';

class SharedPreferencesRequests {

  static const String _surahEnglishNameKey = 'surahEnglishName';
  static const String _ayahNumberKey = 'ayahNumber';

  static void setValues({required String surahEnglishName, required int ayahNumber}) {
    SharedPreferencesHelper.setString(_surahEnglishNameKey, surahEnglishName);
    SharedPreferencesHelper.setInt(_ayahNumberKey, ayahNumber);
  }

  static Future<String> getSurahEnglishName(){
    return SharedPreferencesHelper.getString(_surahEnglishNameKey);
  }

  static Future<int> getAyahNumber(){
     return SharedPreferencesHelper.getInt(_ayahNumberKey);
  }
}
