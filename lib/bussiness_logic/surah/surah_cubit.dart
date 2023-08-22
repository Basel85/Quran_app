import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/surah/surah_states.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitialState());

  static SurahCubit get(context) => BlocProvider.of(context);
  void getListOfSurahs() {
    try {
       
    } on TimeoutException catch (error) {

    }
  }
}
