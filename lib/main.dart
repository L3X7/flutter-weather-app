import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MainApp());

final int _backgroundColorBlueGrey = 0xff263238;

final int _colorBlue = 0xff0277bd;
final int _colorDarkBlue = 0xff0370af;

final String _imgRainIcon = 'images/rain.svg';

final int _colorLightBlue = 0xff29b6f6;
final int _colorDarkLightBlye = 0xff29b6f6;

final String _imgSnowIcon = 'images/snow-alt.svg';

final int _colorOrange = 0xffffa726;
final int _colorDarkOrange = 0xfffb8c00;

final String _imgSunnyIcon = 'images/sun.svg';

final int _colorGrey = 0xff546e7a;
final int _colorDarkGrey = 0xff455a64;

final String _imgRainThunder = 'images/lightning-rain.svg';

final int _colorGreyLight = 0xff90a4ae;
final int _colorDarkGreyLight = 0xff455a64;

final String _imgCloudSun = 'images/cloud-sun.svg';


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

  bool _visibilityFAB = false;

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Opacity(opacity: _visibilityFAB? 1.0: 0.0,
          child: FloatingActionButton(onPressed: (){
            
          },
            backgroundColor: Color(_backgroundColorBlueGrey),
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: new Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _currentIndex == 0
                      ? const Icon(Icons.home, color: Color(0xff78909c))
                      : const Icon(Icons.home, color: Color(0xff263238)),
                  title: _currentIndex == 0
                      ? Text(
                          'Home',
                          style: TextStyle(color: Color(0xFF546e7a)),
                        )
                      : Text(
                          'Home',
                          style: TextStyle(color: Color(0xff263238)),
                        ),
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? const Icon(Icons.language, color: Color(0xFF546e7a))
                      : const Icon(Icons.language, color: Color(0xff263238)),
                  title: _currentIndex == 1
                      ? Text(
                          'Cities',
                          style: TextStyle(color: Color(0xFF546e7a)),
                        )
                      : Text(
                          'My cities',
                          style: TextStyle(color: Color(0xff263238)),
                        ),
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? const Icon(Icons.settings, color: Color(0xFF546e7a))
                      : const Icon(Icons.settings, color: Color(0xff263238)),
                  title: _currentIndex == 1
                      ? Text(
                          'Settings',
                          style: TextStyle(color: Color(0xFF546e7a)),
                        )
                      : Text(
                          'Settings',
                          style: TextStyle(color: Color(0xff263238)),
                        ),
                ),
              ],
            )));
  }

  void onTabTapped(int index) {
    setState(() {
      this._currentIndex = index;
      this.currentPage = containerPages[index];
      _visibilityFAB = index == 1? true: false;
    });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> othersDays = new List();
    List<String> days = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado',
      'Domingo'
    ];

    for (var i = 0; i < 6; i++) {
      othersDays.add(Card(
        color: Color(_colorDarkBlue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15, bottom: 10),
                  child: SvgPicture.asset(_imgRainThunder,
                      width: 35, height: 35, color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    days[i],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    '30 °C',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ));
    }

    Widget textCity = Container(
      padding: EdgeInsets.only(top: 45.00),
      child: Text(
        'San Salvador',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );

    Widget imageWeather = Container(
      padding: EdgeInsets.only(top: 30.0),
      child: SvgPicture.asset(
        _imgRainIcon,
        width: 430.0,
        height: 150.0,
        color: Colors.white,
      ),
    );

    Widget textWeather = Container(
      padding: EdgeInsets.only(top: 20.00),
      child: Text(
        '20 °C',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ),
    );

    return Container(
        padding: EdgeInsets.only(top: 30.0),
        width: double.infinity,
        height: double.infinity,
        color: Color(_colorBlue),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[textCity, imageWeather, textWeather],
                ))
              ],
            ),
            Expanded(
              child: new ListView(
                children: othersDays,
              ),
            )
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
    String textDefault = '';
    for (var i = 0; i < 5; i++) {
      switch (i) {
        case 0:
          defaultColor = Color(_colorGrey);
          defaultIcon = _imgRainThunder;
          textDefault = 'Santa Ana';
          break;
        case 1:
          defaultColor = Color(_colorBlue);
          defaultIcon = _imgRainIcon;
          textDefault = 'San Salvador';
          break;
        case 2:
          defaultColor = Color(_colorOrange);
          defaultIcon = _imgSunnyIcon;
          textDefault = 'San Miguel';
          break;
        case 3:
          defaultColor = Color(_colorGreyLight);
          defaultIcon = _imgCloudSun;
          textDefault = 'La libertad';
          break;
        default:
          defaultColor = Color(_colorLightBlue);
          defaultIcon = _imgSnowIcon;
          textDefault = 'Ahuachapan';
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
                        textDefault,
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
                    child: SvgPicture.asset(defaultIcon,
                        width: 50, height: 50, color: Colors.white),
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: new ListView(children: cards),
            ),
          ],
        ));
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
      child: SvgPicture.asset(
        _imgRainIcon,
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
