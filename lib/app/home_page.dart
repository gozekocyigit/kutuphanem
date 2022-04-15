import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kutuphanem/model/user_model.dart';
import 'package:kutuphanem/services/auth_base.dart';
import 'package:kutuphanem/locator.dart';
import 'package:kutuphanem/services/firebase_auth_service.dart';
import 'package:kutuphanem/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  /* 15. videoda siliyor
  final Function onSignOut;
  AuthBase authService = locator <FirebaseAuthService>();
  */

  final UserBilgi? user;
  
   HomePage({Key? key,required this.user})
       : super(key: key);




  @override
  Widget build(BuildContext context) {

    final _userModel = Provider.of<UserModel>(context); //15. videoda açılıyor
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton(onPressed:() =>_cikisYap(context), child: Text("Çıkış Yap", style: TextStyle(color: Colors.white),),)
        ], //15. videoda cikisyapi degistiriyor
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("HOŞGELDİNİZ ${user!.userID}"),
      ),
    );
  }

  Future<bool> _cikisYap(BuildContext context ) async{
    //await FirebaseAuth.instance.signOut();
    final _userModel = Provider.of<UserModel>(context,listen: false);
    bool sonuc = await _userModel.signOut();
    /*
    bool sonuc = await authService.signOut();  //15. videoda değiştiriyor
    onSignOut();
     */

    return sonuc;
  }
}
