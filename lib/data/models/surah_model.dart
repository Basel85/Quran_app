import 'package:quran_app/data/models/ayah_model.dart';

class SurahModel {
  final int surahNumber;
  final String surahName;
  final String surahEnglishName;
  final String surahEnglishNameTranslation;
  final int numberOfAyahs;
  final List<AyahModel>? surahAyahs;

  SurahModel(this.surahNumber, this.surahName, this.surahEnglishName, this.surahEnglishNameTranslation, this.numberOfAyahs, this.surahAyahs);
  factory SurahModel.fromJson(Map<String,dynamic> surahJson){
    return SurahModel(
      surahJson['number'],
      surahJson['name'],
      surahJson['englishName'],
      surahJson['englishNameTranslation'],
      surahJson['numberOfAyahs'],
      (surahJson['ayahs'] as List).map((ayah) => AyahModel.fromJson(ayah)).toList()
    );
  }
}
