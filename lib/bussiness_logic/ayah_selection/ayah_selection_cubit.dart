import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/ayah_selection/ayah_selection_states.dart';
import 'package:quran_app/data/network/requests/shared_preferences_requests.dart';

class AyahSelectionCubit extends Cubit<AyahSelectionState> {
  late int currentAyahNumber;
  late String currentSurahEnglishName;
  AyahSelectionCubit() : super(AyahSelectionInitialState());

  static AyahSelectionCubit get(context) => BlocProvider.of(context);
  
  void selectAyah(int ayahNumber, String surahEnglishName) async {
    currentAyahNumber = await SharedPreferencesRequests.getAyahNumber();
    currentSurahEnglishName =
        await SharedPreferencesRequests.getSurahEnglishName();
    if (!(ayahNumber == currentAyahNumber &&
        surahEnglishName == currentSurahEnglishName)) {
      emit(AyahSelectionChangedAyahState(
          currentAyahNumber: ayahNumber,
          currentSurahEnglishName: surahEnglishName,
          previousAyahNumber: currentAyahNumber));
      SharedPreferencesRequests.setValues(ayahNumber: ayahNumber, surahEnglishName: surahEnglishName);
    }
  }
}
