//import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterku/home/akun.dart';
import 'package:flutterku/home/home_page.dart';
import 'package:flutterku/home/upload_page.dart';
//import 'package:flutterku/login/login_page.dart';
//import 'package:flutterku/res/Strings.dart';

/// This is the stateful widget that the main application instantiates.
class Beranda extends StatefulWidget {
  final User user;
  Beranda(this.user);
  @override
  State<Beranda> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Beranda> {
  int _selectedIndex = 0;

  //List<Widget> _widgetOptions = <Widget>[HomePage(widget.user)];

  List _widgetOptions() {
    return [
      UploadPage(),
      Akun(widget.user),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
