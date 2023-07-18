import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static Future<User?> iniciarSesion({required BuildContext context}) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;

    User? user;

    GoogleSignIn objGoogleSingin = GoogleSignIn();

    GoogleSignInAccount? objGoogleSingInAccount =
        await objGoogleSingin.signIn();

    if (objGoogleSingInAccount != null) {
      GoogleSignInAuthentication objgoogleSingInAuthentication =
          await objGoogleSingInAccount.authentication;

      final idToken2 = objgoogleSingInAuthentication.idToken;
      print(idToken2);

      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objgoogleSingInAuthentication.accessToken,
          idToken: idToken2);

      try {
        UserCredential userCredential =
            await authenticator.signInWithCredential(credential);

        user = userCredential.user;

        return user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticacion");
      }
    }
  }
}
