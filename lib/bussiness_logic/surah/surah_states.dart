import 'package:quran_app/data/models/surah_model.dart';

abstract class SurahState {}

class SurahInitialState extends SurahState {}

class SurahLoadingState extends SurahState {}

class SurahSuccessState extends SurahState {
  final List<SurahModel> surahs;
  
  SurahSuccessState({required this.surahs});
}

class SurahErrorState extends SurahState {
  final String errorMessage;
  SurahErrorState({required this.errorMessage});
}
