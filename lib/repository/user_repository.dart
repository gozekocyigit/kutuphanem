
import 'package:kutuphanem/model/user_model.dart';
import 'package:kutuphanem/services/auth_base.dart';
import 'package:kutuphanem/services/fake_auth_service.dart';
import 'package:kutuphanem/services/firebase_auth_service.dart';
import 'package:kutuphanem/locator.dart';


enum AppMode{DEBUG, RELEASE}

class UserRepository implements AuthBase{

  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService = locator<FakeAuthenticationService>();

  AppMode appMode=AppMode.RELEASE;

  @override
  Future<UserBilgi?> currentUser() async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.currentUser();
    }else{
      return await _firebaseAuthService.currentUser();
    }

  }

  @override
  Future<bool> signOut() async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signOut();
    }else{
      return await _firebaseAuthService.signOut();
    }

  }

  @override
  Future<UserBilgi?> singInAnonymously() async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.singInAnonymously();
    }else{
      return await _firebaseAuthService.singInAnonymously();
    }

  }


}