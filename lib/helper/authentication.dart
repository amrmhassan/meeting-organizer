// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meeting_organizer/screens/holder_screen/holder_screen.dart';
import 'package:meeting_organizer/screens/sign_in_screen/sign_in_screen.dart';

class Authentication {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HolderScreen();
          } else {
            return const SignInScreen();
          }
        });
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    try {
      FirebaseAuth.instance.signOut();
      final GoogleSignIn google = GoogleSignIn();
      await google.disconnect();
      await google.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('cant sign out google');
      }
    }
  }
}
