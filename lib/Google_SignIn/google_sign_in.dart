import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInClass {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAuthentication> login() async {
    GoogleSignInAuthentication auth;
    GoogleSignInAccount? account = await _googleSignIn.signIn();
    if (account == null) {
      throw Exception();
    } else {
      auth = await account.authentication;
    }
    // log(auth.idToken.toString());
    // log(auth.idToken!.length.toString());
    return auth;
  }
}
