import 'package:quran_app/data/models/ayah_model.dart';

class SurahModel {
  final int surahNumber;
  final String surahName;
  final String surahEnglishName;
  final String surahEnglishNameTranslation;
  final int numberOfAyahs;
  final List<AyahModel> surahAyahs;

  SurahModel(
      {required this.surahNumber,
      required this.surahName,
      required this.surahEnglishName,
      required this.surahEnglishNameTranslation,
      required this.numberOfAyahs,
      this.surahAyahs = const []});
  factory SurahModel.getListOfSurahFromJson(Map<String, dynamic> surahJson) {
    return SurahModel(
      surahNumber: surahJson['number'],
      surahName: surahJson['name'],
      surahEnglishName: surahJson['englishName'],
      surahEnglishNameTranslation: surahJson['englishNameTranslation'],
      numberOfAyahs: surahJson['numberOfAyahs'],
    );
  }
}
