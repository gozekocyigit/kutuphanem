import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kutuphanem/app/sign_in/email_sifre_giris_ve_kayit.dart';
import 'package:kutuphanem/locator.dart';
import 'package:kutuphanem/model/user_model.dart';
import 'package:kutuphanem/services/auth_base.dart';
import 'package:kutuphanem/services/firebase_auth_service.dart';
import 'package:kutuphanem/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  /* 15. videoda siliyor
  final Function(UserBilgi) onSingIn;
  AuthBase authService = locator<FirebaseAuthService>();

   SignInPage({Key? key, required this.onSingIn}) : super(key: key);
   */

  /*  15. videodan önce burası açık
  void _misafirGirisi() async{
    UserBilgi? _user = await authService.singInAnonymously();
     onSingIn(_user!); //ünlem koydum ben 15. videoda siliyor
    print("Oturum açan user id:"+ _user.userID.toString());
  }
   */

  @override
  //State<SignInPage> createState() => _SignInPageState();


/* class _SignInPageState extends State<SignInPage> {

  @override
  void initState() {
    // TODO: implement initState   //yunus yazdı silme
    super.initState();

  } */
  void _misafirGirisi(BuildContext context) async{
    final _userModel = Provider.of<UserModel>(context, listen: false);
    UserBilgi? _user = await _userModel.singInAnonymously();
    //UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();

    print("Oturum açan user:" + _user!.userID.toString());
  }

  void _emailVeSifreGiris(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context)=> EmailveSifreLoginPage(),
        fullscreenDialog: true,  //ekranın açılma şeklini değiştiriyor
    ),
    );
  }


  @override
  Widget build(BuildContext context) {

    final _userModel = Provider.of<UserModel>(context); //15. videoda yazıyor

    return Scaffold(
      appBar: AppBar(
        title: Text("KÜTÜPHANEM"),
        elevation: 10,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0), //padding yanlardan boşluk bırakıyor
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,

          children:<Widget>[
            Text(
              "Giriş Yapın",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton.icon(onPressed: ()=> _emailVeSifreGiris(context), icon: Icon(Icons.account_circle_outlined), label: Text("Kullanıcı Girişi"), style: ElevatedButton.styleFrom(primary: Colors.orange)),
            ElevatedButton.icon(onPressed:() => _misafirGirisi(context), icon: Icon(Icons.person), label: Text("Misafir Girişi"), style: ElevatedButton.styleFrom(primary: Colors.black12)),


          ],
        ),
      ),
    );
  }
}

