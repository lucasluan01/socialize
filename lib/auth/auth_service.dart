import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialize/stores/user_store.dart';

class AuthService {
  User? _currtentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isLoading = true;

  Future<void> signInwithGoogle() async {
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        _currtentUser = authResult.user!;
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // TODO: signOut não está funcionando
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      var user = GetIt.instance<UserStore>();
      user.setUser(null);
    } catch (e) {
      rethrow;
    }
  }

  User? get currentUser {
    return _currtentUser;
  }
}
