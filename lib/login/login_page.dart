import 'package:flutter/material.dart';
import 'package:flutterku/helper/auth_service.dart';
import 'package:flutterku/res/Strings.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.tittle),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Input Email Anda ..."),
              ),
            ),
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: passwordController,
                decoration:
                    InputDecoration(labelText: "Input Password Anda ..."),
              ),
            ),
            RaisedButton(
              child: Text(Strings.anonymous),
              onPressed: () async {
                await AuthServices.signInAnonymous();
              },
            ),
            RaisedButton(
              child: Text(Strings.login),
              onPressed: () async {
                await AuthServices.signIn(
                    emailController.text, passwordController.text);
              },
            ),
            RaisedButton(
              child: Text(Strings.signup),
              onPressed: () async {
                await AuthServices.signUp(
                    emailController.text, passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
