import 'package:firebase_auth/firebase_auth.dart';
import 'package:quran_app/data/data_providers/remote/firebase_helper.dart';

class FirebaseAuthStateChanger {
  static Stream<User?> authStateChanges() {
    return FirebaseHelper.getInstance().authStateChanges();
  }
}
