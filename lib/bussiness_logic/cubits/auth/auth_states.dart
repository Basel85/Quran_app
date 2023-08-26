abstract class AuthState {}
class AuthInitialState extends AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {
  final String successMessage;
  AuthSuccessState(this.successMessage);
}
class AuthErrorState extends AuthState {
  final String errorMessage;
  AuthErrorState(this.errorMessage);
}