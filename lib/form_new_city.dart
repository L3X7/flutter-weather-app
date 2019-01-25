import 'package:flutter/material.dart';
import 'package:weather_app/models/city.dart';
import 'package:http/http.dart' as http;

class FormNewCity extends StatefulWidget {
  @override
  _FormNewCity createState() => _FormNewCity();
}

class _FormNewCity extends State<FormNewCity> {
  Icon actionIcon;
  Widget appBarTitle;
  List<Widget> cards;
  Widget contentList;
  bool visibilityList = false;
  List<City> cityList;
  Future<http.Response> getCities;

  @override
  void initState() {
    super.initState();
    actionIcon = new Icon(
      Icons.search,
      color: Colors.white,
    );
    appBarTitle = new Text(
      ' ',
      style: TextStyle(color: Colors.white),
    );
    cards = new List();
    contentList = emptyCities();
    cityList = <City>[];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: <Widget>[Expanded(child: contentList)],
        ),
      ),
    );
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
              onPressedSearchButton(context);
            });
          },
        )
      ],
    );
  }

  void onPressedSearchButton(BuildContext context) {
    if (this.actionIcon.icon == Icons.search) {
      this.actionIcon = new Icon(
        Icons.close,
        color: Colors.white,
      );
      this.appBarTitle = new TextField(
        style:
            new TextStyle(color: Colors.white, fontFamily: 'Montserrat_Medium'),
        decoration: new InputDecoration(
            hintText: 'Buscar cuidad...',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            hintStyle: new TextStyle(color: Colors.white30)),
        onChanged: (text) {
          searchText(text);
        },
      );
    } else {
      this.actionIcon = new Icon(Icons.search, color: Colors.white);
      this.appBarTitle = new Text('');
    }
  }

  Widget listCities() {
    return ListView(
      children: cards,
    );
  }

  Widget emptyCities() {
    return Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.white30,
              size: 70,
            ),
            Text(
              'Buscar ciudad',
              style: TextStyle(
                  color: Colors.white30, fontFamily: 'Montserrat_Medium'),
            )
          ],
        ));
  }

  void searchText(String text) {
    setState(() {
      cards.clear();
      if (text.isEmpty) {
        this.contentList = emptyCities();
        return;
      }

      for(var cities in cityList){
        cards.add(
          ListTile(
            title: Text(cities.name,
                style: TextStyle(
                    fontFamily: 'Montserrat_Medium', color: Colors.white)),
            contentPadding: EdgeInsets.only(left: 30),
          ),
        );
      }
      this.contentList = listCities();
    });
  }


}
