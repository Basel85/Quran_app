import 'package:quran_app/data/network/requests/shared_preferences_requests.dart';

class SurahController {
  static Future<int> getSurahNumber() {
    return SharedPreferencesRequests.getSurahNumber();
  }

  static Future<String> getSurahEnglishNameTranslation() {
    return SharedPreferencesRequests.getSurahEnglishNameTranslation();
  }
}
