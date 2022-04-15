import 'package:flutter/material.dart';

class EmailveSifreLoginPage extends StatefulWidget {
  const EmailveSifreLoginPage({Key? key}) : super(key: key);

  @override
  State<EmailveSifreLoginPage> createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Giriş / Kayıt"),
      ),
      body: Center(
        child: Text("form"),
      ),
    );
  }
}
