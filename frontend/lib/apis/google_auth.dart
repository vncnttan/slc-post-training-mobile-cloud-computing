

import 'package:google_sign_in/google_sign_in.dart';

class GoogleOAuth {
  static final _oauth = GoogleSignIn();

  static void login() async {
    var account = await _oauth.signIn();
    if (account != null){
      print(account.email);
      print(account.displayName);
    }
  }

  static void logout() async {
    if (await _oauth.isSignedIn()) {
      await _oauth.signOut();
    }
  }
}