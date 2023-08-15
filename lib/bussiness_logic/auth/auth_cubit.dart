import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/auth/auth_states.dart';
import 'package:quran_app/data/network/requests/firebase_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  late FirebaseLogin _firebaseLogin;
  static AuthCubit get(context) => BlocProvider.of(context);
  void signInWithGoogle() {
    _firebaseLogin = GoogleLogin();
    _signIn();
  }

  // void signInWithFacebook() {
  //   // _firebaseLogin = FacebookLogin();
  //   _signIn();
  // }

  void signInWithEmailAndPassword() {
    emit(AuthLoadingState());
  }

  void _signIn() async {
    try {
      final UserCredential userCredential = await _firebaseLogin.signIn();
      if (userCredential.user != null) {
        emit(AuthSuccessState("Success Login ${userCredential.user!.email}"));
      } else {
        emit(AuthErrorState("Something went wrong please try again later"));
      }
    } on FirebaseAuthException catch (error) {
      emit(AuthErrorState(error.message!));
    } catch (_) {
      emit(AuthErrorState("Something went wrong please try again later"));
    }
  }
}
