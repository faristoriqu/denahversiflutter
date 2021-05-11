import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> intializeMe() async {
    return await Firebase.initializeApp();
  }

  static Future<User> signInAnonymous() async {
    try {
      UserCredential result = auth.signInAnonymously() as UserCredential;
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    auth.signOut();
  }

  static Stream<User> userStream() => auth.authStateChanges();
}
