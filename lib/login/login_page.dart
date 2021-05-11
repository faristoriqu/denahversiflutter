import 'package:flutter/material.dart';
import 'package:flutterku/helper/auth_service.dart';
import 'package:flutterku/res/Strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.tittle),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(Strings.login),
          onPressed: () async {
            await AuthServices.signInAnonymous();
          },
        ),
      ),
    );
  }
}
