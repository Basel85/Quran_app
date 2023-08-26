import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/cubits/last_read/last_read_states.dart';
import 'package:quran_app/data/network/requests/shared_preferences_requests.dart';

class LastReadCubit extends Cubit<LastReadState> {
  LastReadCubit() : super(LastReadInitialState());
  late int ayahNumber;
  late int surahNumber;
  late String surahEnglishName;
  late String surahEnglishNameTranslation;
  static LastReadCubit get(context) => BlocProvider.of(context);

  Future<void> getValues() async {
    try {
      emit(LastReadLoadingState());
      ayahNumber = await SharedPreferencesRequests.getAyahNumber();
      surahNumber = await SharedPreferencesRequests.getSurahNumber();
      surahEnglishName = await SharedPreferencesRequests.getSurahEnglishName();
      surahEnglishNameTranslation =
          await SharedPreferencesRequests.getSurahEnglishNameTranslation();
      emit(LastReadSuccessState(
          ayahNumber: ayahNumber,
          surahNumber: surahNumber,
          surahEnglishName: surahEnglishName,
          surahEnglishNameTranslation: surahEnglishNameTranslation));
    } catch (_) {
      emit(LastReadErrorState(errorMessage: "Something went wrong"));
    }
  }
}
