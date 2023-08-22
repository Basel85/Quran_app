import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/surah/surah_states.dart';
import 'package:quran_app/data/network/requests/surah_requests.dart';
import 'package:quran_app/utils/app_custom_exception.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitialState());

  static SurahCubit get(context) => BlocProvider.of(context);

  Future<void> getListOfSurahs() async {
    try {
      emit(SurahLoadingState());
      final surahs = await SurahRequests.getListOfSurahs();
      emit(SurahSuccessState(surahs: surahs));
    } on TimeoutException catch (_) {
      emit(SurahErrorState(errorMessage: "Loading time out please try again"));
    } on AppCustomException catch (exception) {
      emit(SurahErrorState(errorMessage: exception.message));
    } on SocketException catch (_) {
      emit(SurahErrorState(
          errorMessage:
              "No internet connection Please check your internet connection and try again"));
    } catch (e) {
      emit(SurahErrorState(
          errorMessage: "Something went wrong please try again later"));
    }
  }
}
