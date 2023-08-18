import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bussiness_logic/auth/auth_states.dart';
import 'package:quran_app/data/data_providers/remote/firebase_helper.dart';
import 'package:quran_app/data/network/requests/firebase_auth_state_changer.dart';
import 'package:quran_app/data/network/requests/firebase_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final FirebaseLogin _firebaseGoogleLogin = GoogleLogin();
  static AuthCubit get(context) => BlocProvider.of(context);
  void signInWithGoogle() {
    _signIn(_firebaseGoogleLogin);
  }

  // void signInWithFacebook() {
  //   // _firebaseLogin = FacebookLogin();
  //   _signIn();
  // }

  void signInWithEmailAndPassword() {
    emit(AuthLoadingState());
  }

  void _signIn(FirebaseLogin firebaseLogin) async {
    try {
      final userCredential = await firebaseLogin.signIn();
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

  Stream<User?> authStateChanges() {
    return FirebaseAuthStateChanger.authStateChanges();
  }

  void logout() {
    FirebaseHelper.getInstance().signOut();
  }
}
