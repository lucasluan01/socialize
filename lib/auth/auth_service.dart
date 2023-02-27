import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  User? _currtentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isLoading = true;

  Future<void> signInwithGoogle() async {
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        final UserCredential authResult = await _auth.signInWithCredential(credential);
        _currtentUser = authResult.user!;
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  User? get currentUser {
    return _currtentUser;
  }
}
