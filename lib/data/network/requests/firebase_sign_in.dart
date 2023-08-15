
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quran_app/data/data_providers/remote/firebase_helper.dart';

abstract class FirebaseLogin {
  Future<UserCredential> signIn();
}

class GoogleLogin extends FirebaseLogin {
  @override
  Future<UserCredential> signIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final OAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseHelper.getInstance()
        .signInWithCredential(googleAuthCredential);
  }
}

// class FacebookLogin extends FirebaseLogin {
//   @override
//   Future<UserCredential> signIn() async {
//     // Trigger the sign-in flow
//     final LoginResult loginResult = await FacebookAuth.instance.login();
//
//     // Create a credential from the access token
//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance
//         .signInWithCredential(facebookAuthCredential);
//   }
// }
