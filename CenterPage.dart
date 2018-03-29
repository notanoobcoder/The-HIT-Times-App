import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: new Icon(Icons.check_circle, size: 150.0, color: Colors.green)
        )
    );
  }
}