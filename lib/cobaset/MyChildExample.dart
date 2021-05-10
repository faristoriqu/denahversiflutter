import 'package:flutter/material.dart';
//import 'package:flutterku/denah/main.dart';

class MyChildExample extends StatefulWidget {
  final String text;
  final customFunction;
  final image;
  MyChildExample({Key key, this.text, this.customFunction, this.image})
      : super(key: key);

  _MyChildExampleState createState() => _MyChildExampleState();
}

class _MyChildExampleState extends State<MyChildExample> {
  @override
  Widget build(BuildContext context) {
    String theText = widget.text != null ? widget.text : 'empty';

    return Container(
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(theText),
            FlatButton(
              child: Text('Click me'),
              color: Colors.white,
              onPressed: () {
                widget.customFunction('String from child');
              },
            )
          ],
        ));
  }
}
