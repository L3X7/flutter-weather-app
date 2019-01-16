import 'package:flutter/material.dart';
import 'package:weather_app/tabs/home.dart';
import 'package:weather_app/tabs/cities.dart';
import 'package:weather_app/tabs/settings.dart';

void main() => runApp(MaterialApp(
      title: 'Main App',
      home: MainApp(),
    ));

final int _backgroundColorBlueGrey = 0xff263238;

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => new MainAppState();
//  State<StatefulWidget> createState() {
//    return new MainAppState();
//  }

}

//SingleTickerProviderStateMixin for animation
class MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  TabController controller;
  bool _visibilityFAB = false;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Opacity(
          opacity: _visibilityFAB ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(_backgroundColorBlueGrey),
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Home(),
            new Cities(),
            new Settings(),
          ],
          controller: controller,
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
            controller: controller,
          ),
        ));
  }
}
