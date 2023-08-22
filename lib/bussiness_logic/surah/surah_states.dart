abstract class SurahState{}
class SurahInitialState extends SurahState{}
class SurahLoadingState extends SurahState{}
class SurahSuccessState extends SurahState{}
class SurahErrorState extends SurahState{
  final String errorMessage;
  SurahErrorState({required this.errorMessage});
}