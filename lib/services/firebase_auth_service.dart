import 'package:firebase_auth/firebase_auth.dart';
import 'package:kutuphanem/model/user_model.dart';
import 'package:kutuphanem/services/auth_base.dart';


class FirebaseAuthService implements AuthBase{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserBilgi?> currentUser() async{
    try{
     // User user = await _firebaseAuth.currentUser!;  12. videodan sonra
      User user = await _firebaseAuth.currentUser!;
      return _userFromFirebase(user);
    }catch(e){
      print("HATA CURRENT USER:"+e.toString());
      return null;
    }


  }

  UserBilgi? _userFromFirebase(User user){   //aldığı firebase userı normal bir usera donusturuyo
    if(user == null)
      return null;

    return UserBilgi(userID: user.uid);
  }

  @override
  Future<bool> signOut() async{
    try{
      await _firebaseAuth.signOut();
      return true;
    }catch(e){
      print("SIGN OUT HATA:"+ e.toString());
      return false;
    }
  }

  @override
  Future<UserBilgi?> singInAnonymously() async{
    try{

      UserCredential sonuc = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(sonuc.user!);

    }catch(e){
      print("ANONİM GİRİS HATASI:" + e.toString());
      return null;
    }

  }

}