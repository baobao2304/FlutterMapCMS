import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_cms/model/userfirebase.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj
  userfirebase _userFormFirebaseUser(User user) {
    return user != null ? userfirebase(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<userfirebase> get user {
    return _auth.authStateChanges().map(_userFormFirebaseUser);
    // .map((FirebaseUser user) => _userFormFirebaseUser(user));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      // await _auth.signInAnonymously();
      // AuthResult result = await _auth.signInAnonymously();
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFormFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
