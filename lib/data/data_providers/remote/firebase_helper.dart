import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper{
  static FirebaseAuth? _firebaseAuth;
  static FirebaseAuth getInstance(){
    _firebaseAuth ??= FirebaseAuth.instance;
    return _firebaseAuth!;
  }
}