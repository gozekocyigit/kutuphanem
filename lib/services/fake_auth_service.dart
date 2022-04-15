import 'package:kutuphanem/model/user_model.dart';
import 'package:kutuphanem/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase{  //fake işlem yapıyor firebaseye gitmiyor.

  String userID="123";
  @override
  Future<UserBilgi?> currentUser() async{

    return await Future.value(UserBilgi(userID: userID ));
  }

  @override
  Future<bool> signOut() {

    return Future.value(true);
  }

  @override
  Future<UserBilgi?> singInAnonymously() async{

    return await Future.delayed(Duration(seconds: 2),() => UserBilgi(userID: userID));
  }

}