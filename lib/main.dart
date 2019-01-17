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
  TabController _tabController;
  bool _visibilityAppBar = false;
  double _sizeAppBar = 50.0;

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
      _visibilityAppBar = _tabController.index == 1 ? false : true;
      _sizeAppBar = _visibilityAppBar? 0.0: 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            toolbarOpacity: _visibilityAppBar ? 1.0 : 00,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add, color: Colors.black,), onPressed: null, tooltip: 'Agregar Ciudad',)
            ],
          ),
          preferredSize: Size.fromHeight(_sizeAppBar)),
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
