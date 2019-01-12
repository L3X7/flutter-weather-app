import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  Home home;
  Cities cities;
  Settings settings;

  List<Widget> containerPages;
  Widget currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    home = new Home();
    cities = new Cities();
    settings = new Settings();
    currentPage = home;
    containerPages = [home, cities, settings];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('My cities')),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), title: Text('COnfiguration')),
          ],
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      this._currentIndex = index;
      this.currentPage = containerPages[index];
    });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget textCity = Container(
      padding: EdgeInsets.only(top: 100.00),
      child: Text('San Salvador',
      style: TextStyle(fontSize: 30), ),
    );
    
    Widget imageWeather = Container(
      padding: EdgeInsets.only(top: 60.0),
      child: Image.asset(
        'images/lluvia.png',
        width: 500.0,
        height: 200.0,
      ),
    );
    
    Widget textWeather = Container(
      padding: EdgeInsets.only(top: 40.00),
      child: Text('20 C',
      style: TextStyle(fontSize: 60),),
    );

    return Container(
      padding: EdgeInsets.only(top: 30.0),
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              textCity,
              imageWeather,
              textWeather
            ],
          ))
        ],
      )
    );

  }
}

class Cities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
    //return Container(padding: EdgeInsets.all(130.0), color: Colors.red);
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(130.0), color: Colors.black);
  }
}
