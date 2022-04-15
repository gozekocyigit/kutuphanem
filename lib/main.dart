import 'package:flutter/material.dart';
import 'package:kutuphanem/app/home_page.dart';
import 'package:kutuphanem/locator.dart';
import 'package:kutuphanem/services/firebase_auth_service.dart';
import 'package:kutuphanem/app/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kutuphanem/viewmodel/user_model.dart';
import 'package:provider/provider.dart';


void main() async{
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // silme
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'KUTUPHANEM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home : ChangeNotifierProvider(
          create: (context) => UserModel(), //15. derste değiştirildi
          child: LandingPage()
      ),
    );
  }
}

