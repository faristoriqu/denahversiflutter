import 'dart:developer';

import 'package:flutter/material.dart';

int i = 0;
void tahu() {
  i++;
  log("data : $i");
}

void changeImage(String nama) {}
void okelah;
Future<void> dialogku(context, okelah) async {
  log("Anda Menekan Tombol = ");
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Kavling No 1 '),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Ingin Beli ?')],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Beli'),
            onPressed: () {
              Navigator.of(context).pop();
              okelah('assets/images/ataskuning.png');
            },
          ),
        ],
      );
    },
  );
}
