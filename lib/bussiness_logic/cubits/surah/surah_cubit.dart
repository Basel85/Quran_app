import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/cubits/surah/surah_states.dart';
import 'package:quran_app/data/network/requests/surah_requests.dart';
import 'package:quran_app/utils/app_custom_exception.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitialState());

  static SurahCubit get(context) => BlocProvider.of(context);

  static const String _timeOutExceptionMessage =
      "Loading time out please try again";
  static const String _socketExceptionMessage = "No internet connection Please check your internet connection and try again";
  static const String _unexpectedExceptionMessage =
      "Something went wrong please try again later";

  Future<void> getListOfSurahs() async {
    try {
      emit(SurahGetListOfSurahsLoadingState());
      final surahs = await SurahRequests.getListOfSurahs();
      emit(SurahGetListOfSurahsSuccessState(surahs: surahs));
    } on TimeoutException catch (_) {
      emit(SurahGetListOfSurahsErrorState(
          errorMessage: _timeOutExceptionMessage));
    } on AppCustomException catch (exception) {
      emit(SurahGetListOfSurahsErrorState(errorMessage: exception.message));
    } on SocketException catch (_) {
      emit(SurahGetListOfSurahsErrorState(
          errorMessage:
              _socketExceptionMessage));
    } catch (e) {
      emit(SurahGetListOfSurahsErrorState(
          errorMessage: _unexpectedExceptionMessage));
    }
  }
  Future<void> getSurahAyahs({required int surahNumber}) async {
    try {
      emit(SurahGetSurahAyahsLoadingState());
      final ayahs = await SurahRequests.getSurahAyahs(surahNumber);
      emit(SurahGetSurahAyahsSuccessState(surahAyahs: ayahs));
    } on TimeoutException catch (_) {
      emit(SurahGetSurahAyahsErrorState(
          errorMessage: _timeOutExceptionMessage));
    } on AppCustomException catch (exception) {
      emit(SurahGetSurahAyahsErrorState(errorMessage: exception.message));
    } on SocketException catch (_) {
      emit(SurahGetSurahAyahsErrorState(
          errorMessage:
              _socketExceptionMessage));
    } catch (e) {
      emit(SurahGetSurahAyahsErrorState(
          errorMessage: _unexpectedExceptionMessage));
    }
  }
}
