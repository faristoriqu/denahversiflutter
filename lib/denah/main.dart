import 'dart:developer';

import 'package:flutter/material.dart';

int i = 0;
void tahu() {
  i++;
  log("data : $i");
}

void changeImage(String nama) {}

Future<void> dialogku(context, okelah()) async {
  log("Anda Menekan Tombol = ");
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Ini Adalah '),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Jalan ini tidak dijual')],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Oke'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
