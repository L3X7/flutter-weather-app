import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _cards = new List();
    List<String> _days = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado',
      'Domingo'
    ];

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


    for (var i = 0; i < 6; i++) {
      _cards.add(new Card(
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
                    _days[i],
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

    // TODO: implement build
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.only(top: 30.0),
        width: double.infinity,
        height: double.infinity,
        color: new Color(_colorBlue),
        child: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[textCity, imageWeather, textWeather],
                    ))
              ],
            ),
            Expanded(
              child: new ListView(
                children: _cards,
              ),
            )
          ],
        ),
      ),
    );
  }
}
