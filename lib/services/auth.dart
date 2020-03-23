import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in Anonymous
  Future signInAnon () async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }

  //Sign in with Email and Password


  //Register with email and password


  //Sign out

}