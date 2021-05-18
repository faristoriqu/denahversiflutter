import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterku/controller/upload_controller.dart';
import 'package:flutterku/models/view_model.dart';
import 'package:flutterku/res/Strings.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File file;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text(Strings.tittle + " " + Strings.upload),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (file != null)
                    ? Container(
                        width: 200,
                        height: 200,
                        child: Image.file(file),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Text(Strings.upload),
                  onPressed: () async {
                    File _file = await UploadController.getFile();

                    setState(() {
                      file = _file;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
