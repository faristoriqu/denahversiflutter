import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> intializeMe() async {
    return await Firebase.initializeApp();
  }

  static Future<User> signInAnonymous() async {
    try {
      // perubahan syntax
      //firebaseuser  => user
      //authresul => usercredential
      //onAuthStateChanged => authStateChanges()
      //https://stackoverflow.com/questions/59377277/undefined-class-authresult-in-flutter

      UserCredential credential = auth.signInAnonymously() as UserCredential;
      User user = credential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User> signUp(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = credential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User> signIn(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = credential.user;
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
