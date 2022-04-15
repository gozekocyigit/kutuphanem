import 'package:flutter/material.dart';
import 'package:kutuphanem/model/user_model.dart';
import 'package:kutuphanem/repository/user_repository.dart';
import 'package:kutuphanem/services/auth_base.dart';
import '../locator.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase{

  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  UserBilgi?  _user;


   UserBilgi? get user => _user;

  ViewState get  state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();  //arayüze bilgi vermeyi sağlıyor
  }

  UserModel(){
    currentUser();
  }

  @override
  Future<UserBilgi?> currentUser() async{
    try{
      state=ViewState.Busy;
      _user = await _userRepository.currentUser();
      notifyListeners();
      return _user;
    }catch(e){
      debugPrint("Viewmodelde current user hatası:"+ e.toString());
      return null;
    }finally{
      state=ViewState.Idle;
    }

  }

  @override
  Future<bool> signOut() async{
    try{
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      notifyListeners();
      return sonuc;
    }catch(e){
      debugPrint("Viewmodelde sign out hatası:"+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserBilgi?> singInAnonymously() async{
    try{
      state=ViewState.Busy;
      _user = await _userRepository.singInAnonymously();
      notifyListeners();
      return _user;
    }catch(e){
      debugPrint("Viewmodelde sing in anonymously hatası:"+ e.toString());
      return null;
    }finally{
      state=ViewState.Idle;
    }
  }


}