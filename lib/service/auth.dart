import 'package:firebase_auth/firebase_auth.dart';
import 'package:testproject/models/user.dart';
import 'package:testproject/service/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser); // smae thing
  }

//singn in anonimus
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      print("asdasdada");
      return null;
    }
  }

//sign with email pass
 Future signInWithEmailandpassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

//register withr email pass

  Future registerWithEmailandpassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;

      await DatabaseService(uid: user.uid).updateUserData("0", "user", 100);
      return _userFromFirebaseUser(user);
    }catch(e){    
      print(e.toString());
      return null;
    }
  }


  // Future registerWithEmailandpassword(String email, String password) async{
  //   try{
  //     AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     FirebaseUser user =result.user;
  //     return _userFromFirebaseUser(user);
  //   }catch(e){    
  //     print(e.toString());
  //     return null;
  //   }
  // }


//sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
