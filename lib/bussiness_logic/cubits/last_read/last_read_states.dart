abstract class LastReadState {}

class LastReadInitialState extends LastReadState {}

class LastReadLoadingState extends LastReadState {}

class LastReadSuccessState extends LastReadState {
  final String surahEnglishNameTranslation;
  final String surahEnglishName;
  final int ayahNumber;
  final int surahNumber;
  LastReadSuccessState(
      {required this.surahEnglishNameTranslation,
      required this.surahEnglishName,
      required this.ayahNumber,
      required this.surahNumber});
}
class LastReadErrorState extends LastReadState {
  final String errorMessage;
  LastReadErrorState({required this.errorMessage});
}
