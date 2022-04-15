import 'package:kutuphanem/model/user_model.dart';

abstract class AuthBase{

  Future<UserBilgi?> currentUser();
  Future<UserBilgi?> singInAnonymously();
  Future<bool> signOut();
}


