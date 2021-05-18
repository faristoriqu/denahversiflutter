import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterku/home/beranda.dart';
//import 'package:flutterku/home/home_page.dart';
import 'package:provider/provider.dart';

import 'login/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return (user == null) ? LoginPage() : Beranda(user);
  }
}
