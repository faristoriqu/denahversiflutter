import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterku/helper/auth_service.dart';
import 'package:flutterku/res/Strings.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.tittle + " - " + Strings.beranda),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Upload File SVG Anda..."),
            RaisedButton(
              child: Text(Strings.upload),
              onPressed: () async {
                await AuthServices.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
