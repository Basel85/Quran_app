abstract class AyahSelectionState {}

class AyahSelectionInitialState extends AyahSelectionState {}

class AyahSelectionChangedAyahState extends AyahSelectionState {
  final int currentAyahNumber;
  final int previousAyahNumber;
  final String currentSurahEnglishName;
  AyahSelectionChangedAyahState(
      {required this.previousAyahNumber,
      required this.currentSurahEnglishName,
      required this.currentAyahNumber});
}
