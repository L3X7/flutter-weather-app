import 'package:flutter/material.dart';
import 'package:weather_app/tabs/home.dart';
import 'package:weather_app/tabs/cities.dart';
import 'package:weather_app/tabs/settings.dart';

final int _colorGrey = 0xff546e7a;

final int _backgroundColorBlueGrey = 0xff263238;


void main() => runApp(MaterialApp(
      title: 'Main App',
      home: MainApp(),
    ));

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => new MainAppState();
//  State<StatefulWidget> createState() {
//    return new MainAppState();
//  }

}

//SingleTickerProviderStateMixin for animation
class MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(_changeTab);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  void _changeTab() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new Home(),
          new Cities(),
          new Settings(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          indicatorColor: Colors.blueGrey,
          tabs: <Tab>[
            new Tab(
              icon: new Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
            ),
            new Tab(
                icon: new Icon(
              Icons.language,
              color: Colors.blueGrey,
            )),
            new Tab(
              icon: new Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
            )
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}