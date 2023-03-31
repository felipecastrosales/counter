import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador de pessoas',
      home: const CounterPage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<StatefulWidget> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
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

  final kLabelStyle = const TextStyle(
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
          'assets/images/background.jpg',
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
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
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
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 54,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const Center(
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          minimumSize: const Size(0, 75),
                        ),
                        child: const Icon(
                          Icons.add_circle,
                          size: 36,
                          color: Colors.greenAccent,
                        ),
                        onPressed: () => _changePeople(1),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          minimumSize: const Size(0, 75),
                        ),
                        child: Icon(
                          Icons.remove_circle,
                          size: 36,
                          color: Colors.redAccent[400],
                        ),
                        onPressed: () => _changePeople(-1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Center(
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
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Text(
                _infoText,
                textAlign: TextAlign.center,
                style: kLabelStyle,
              ),
            ),
          ],
        )
      ],
    );
  }
}
