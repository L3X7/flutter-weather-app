import 'package:flutter/material.dart';

class FormNewCity extends StatefulWidget {
  @override
  _FormNewCity createState() => _FormNewCity();
}

class _FormNewCity extends State<FormNewCity> {
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget appBarTitle = new Text(
    ' ',
    style: TextStyle(color: Colors.white),
  );
  FocusNode focusTxt = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activateSearchButton();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: buildAppBar(context));
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.black,
      title: appBarTitle,
      actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              onPressedSearchButton();
            });
          },
        )
      ],
    );
  }

  void activateSearchButton() {
    this.actionIcon = new Icon(
      Icons.close,
      color: Colors.white,
    );
    this.appBarTitle = new TextField(
        focusNode: focusTxt,
        style: new TextStyle(color: Colors.black),
        decoration: new InputDecoration(
            hintText: 'Search',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintStyle: new TextStyle(color: Colors.white)));
    focusInput();
  }

  void onPressedSearchButton() {
    if (this.actionIcon.icon == Icons.search) {
      this.actionIcon = new Icon(
        Icons.close,
        color: Colors.white,
      );
      this.appBarTitle = new TextField(
          focusNode: focusTxt,
          style: new TextStyle(color: Colors.black),
          decoration: new InputDecoration(
              hintText: 'Search',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintStyle: new TextStyle(color: Colors.white)));
      focusInput();
    } else {
      this.actionIcon = new Icon(Icons.search, color: Colors.white);
      this.appBarTitle = new Text('');
    }
  }

  void focusInput() {
    FocusScope.of(context).requestFocus(focusTxt);
  }
}
