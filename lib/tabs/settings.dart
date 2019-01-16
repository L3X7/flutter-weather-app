import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: 30.0),
        width: double.infinity,
        height: double.infinity,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
