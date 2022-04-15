import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kutuphanem/app/home_page.dart';
import 'package:kutuphanem/locator.dart';
import 'package:kutuphanem/model/user_model.dart';
import 'package:kutuphanem/services/auth_base.dart';
import 'package:kutuphanem/services/fake_auth_service.dart';
import 'package:kutuphanem/services/firebase_auth_service.dart';
import 'package:kutuphanem/app/sign_in/sign_in_page.dart';
import 'package:kutuphanem/viewmodel/user_model.dart';
import 'package:provider/provider.dart';


//class LandingPage extends StatefulWidget {    //statelessa çevirdi 15. videoda

  class LandingPage extends StatelessWidget {
    //final AuthBase authService;   locator oluşturduğumuz için buna gerek kalmadı

    //const LandingPage({Key? key, required this.authService}) : super(key: key);

    /* Stateless yaptıktan sonra siliyor
    @override
  _LandingPageState createState() => _LandingPageState();


}

class _LandingPageState extends State<LandingPage> {



   UserBilgi? _user;
  AuthBase authService = locator<FirebaseAuthService>();
  @override
  void initState() {                           //15. videoda kapatıyor
    super.initState();  //silme!!
    _checkUser();
}

  */


    @override
    Widget build(BuildContext context) {
      final _userModel = Provider.of<UserModel>(context);

      if (_userModel.state == ViewState.Idle) {
        if (_userModel.user == null) {
          return SignInPage();
        } else {
          return HomePage(
              user: _userModel.user);
        }
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      /*  15. videodan önce bu kısım açık
    if(_user == null){
      return SignInPage(
          onSingIn: (user){
            _updateUser(user);
          },
      );
    }else {
      return HomePage(
          user: _user,
          onSignOut:(){
            _updateUser(null);
          },
      );
    }
  }

  */

      /*     15. videoda sildi
  Future <void> _checkUser() async{
    _user = await authService.currentUser();
  }

  void _updateUser(UserBilgi? user){
    setState((){
      _user = user;
    });
  }
   */

    }
  }
