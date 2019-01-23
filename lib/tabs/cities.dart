import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/form_new_city.dart';

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
                            fontSize: 20,
                            fontFamily: 'Montserrat_Medium'),
                      ),
                      margin: EdgeInsets.only(top: 20, left: 15)),
                  Container(
                      child: Text(
                        'Nublado',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat_Regular'),
                      ),
                      margin: EdgeInsets.only(top: 2, bottom: 10, left: 15)),
                  Container(
                      child: Text(
                        '36 °C',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            fontFamily: 'Montserrat_Medium'),
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

    // TODO: implement build
    return new Scaffold(
      body: new Container(
        color: Colors.black,
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Container(
                        padding: EdgeInsets.only(top: 25.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                              icon: Icon(Icons.add, color: Colors.white, size: 35),
                              tooltip: 'Agregar ciudad',
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FormNewCity() ));
                              }),
                        )))
              ],
            ),
            new Expanded(
                child: new ListView(
              children: cards,
            ))
          ],
        ),
      ),
    );
  }
}
