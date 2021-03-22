import 'package:assisted_healthcare/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create AUser oject based on User
  TheUser _theUserFromUser(User user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<TheUser> get user {
    return _auth.authStateChanges().map(_theUserFromUser);
  }

  //Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _theUserFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in email/passwd

  // register email/passwd

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
