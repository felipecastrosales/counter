import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Contador de pessoas',
  home: Home(),
  theme: ThemeData(fontFamily: 'Poppins')));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = 'Entre!';

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = 'Isso não é possível';
      } else if (_people <= 5) {
        _infoText = 'Entre';
      } else {
        _infoText = 'Espere um pouco';
      }
    });
  }

  final kLabelStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 36,
    decoration: TextDecoration.none,
    height: 1.5,
  );

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/bgapp.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/people.png',
                height: 175,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(120.0),
              ),
              child: Wrap(
                children: [
                  Center(
                    child: Text(
                      'Quantidade:',
                      textAlign: TextAlign.center,
                      style: kLabelStyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      '$_people',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 54,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 24.0,
                      width: double.maxFinite,
                      child: Divider(
                        thickness: 1.2,
                        color: Colors.white70,
                        indent: 100,
                        endIndent: 100,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.add_circle,
                          size: 50,
                          color: Colors.greenAccent,
                        ),
                        onPressed: () {
                          _changePeople(1);
                        },
                      ),
                      FlatButton(
                        child: Icon(
                          Icons.remove_circle, 
                          size: 50,
                          color: Colors.redAccent[400],
                        ),
                        onPressed: () {
                          _changePeople(-1);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                height: 16,
                width: double.maxFinite,
                child: Divider(
                  thickness: 1,
                  color: Colors.white70,
                  indent: 120,
                  endIndent: 120,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(32.0)
              ),
              child: Text(
                _infoText, textAlign: TextAlign.center, style: kLabelStyle,
              ),
            ),
          ],
        )
      ],
    );
  }
}

