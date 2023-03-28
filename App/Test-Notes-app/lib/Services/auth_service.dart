import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_app/Pages/Homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = const FlutterSecureStorage();

  signinwithgoogle() async {
    //Opens up the windows for selecting the gmail account
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //Check if the Authentication request is processed and is successfull
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //Creates a new user crendential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> storeTokenandData(UserCredential userCredential) async {
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }
}
