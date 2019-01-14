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
        bottomNavigationBar: new Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _currentIndex == 0
                      ? const Icon(Icons.home, color: Color(0xFF546e7a))
                      : const Icon(Icons.home, color: Color(0xFF37474f)),
                  title: _currentIndex == 0
                      ? Text(
                          'Home',
                          style: TextStyle(color: Color(0xFF546e7a)),
                        )
                      : Text(
                          'Home',
                          style: TextStyle(color: Color(0xFF37474f)),
                        ),
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? const Icon(Icons.map, color: Color(0xFF546e7a))
                      : const Icon(Icons.map, color: Color(0xFF37474f)),
                  title: _currentIndex == 1
                      ? Text(
                          'My cities',
                          style: TextStyle(color: Color(0xFF546e7a)),
                        )
                      : Text(
                          'My cities',
                          style: TextStyle(color: Color(0xFF37474f)),
                        ),
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? const Icon(Icons.settings, color: Color(0xFF546e7a))
                      : const Icon(Icons.settings, color: Color(0xFF37474f)),
                  title: _currentIndex == 1
                      ? Text(
                          'Settings',
                          style: TextStyle(color: Color(0xFF546e7a)),
                        )
                      : Text(
                          'Settings',
                          style: TextStyle(color: Color(0xFF37474f)),
                        ),
                ),
              ],
            )));
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
      child: Text(
        'San Salvador',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
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
      child: Text(
        '20 °C',
        style: TextStyle(fontSize: 60, color: Colors.white),
      ),
    );

    return Container(
        padding: EdgeInsets.only(top: 30.0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[textCity, imageWeather, textWeather],
            ))
          ],
        ));
  }
}

class Cities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> cards = new List();
    Color defaultColor;
    String defaultIcon = '';
    for (var i = 0; i < 5; i++) {
      switch (i) {
        case 0:
          defaultColor = Color(0xff607d8b);
          defaultIcon = 'images/lluvia_truenos.png';
          break;
        case 1:
          defaultColor = Colors.blueAccent;
          defaultIcon = 'images/lluvia.png';
          break;
        case 2:
          defaultColor = Colors.amberAccent;
          defaultIcon = 'images/soleado.png';
          break;
        default:
          defaultColor = Color(0xff607d8b);
          defaultIcon = 'images/lluvia_truenos.png';
          break;
      }
      cards.add(new Card(
          color: defaultColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Text(
                        'San Salvador',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      margin: EdgeInsets.only(top: 20, left: 15)),
                  Container(
                      child: Text(
                        'Nublado',
                        style: TextStyle(color: Colors.white),
                      ),
                      margin: EdgeInsets.only(top: 2, bottom: 10, left: 15)),
                  Container(
                      child: Text(
                        '36 °C',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      margin: EdgeInsets.only(bottom: 10, left: 15))
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      defaultIcon,
                      width: 50,
                      height: 50,
                    ),
                    margin: EdgeInsets.only(right: 30),
                  )
                ],
              )
            ],
          )));
    }

    return Container(
      padding: EdgeInsets.only(top: 30.0),
      width: double.infinity,
      height: double.infinity,
      color: Color(0xff37474f),
      child: new ListView(children: cards),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textCity = Container(
      padding: EdgeInsets.only(top: 100.00),
      child: Text(
        'San Salvador',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
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
      child: Text(
        '20 C',
        style: TextStyle(fontSize: 60, color: Colors.white),
      ),
    );

    return Container(
        padding: EdgeInsets.only(top: 30.0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueAccent,
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[textCity, imageWeather, textWeather],
            ))
          ],
        ));
  }
}
