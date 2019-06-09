import 'package:flutter/material.dart';
import 'package:beauty_navigation/beauty_navigation.dart';

void main() {
  runApp(MaterialApp(
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
        ),
        bottomNavigationBar: BeautyNavigation(
          activeIconColor: Colors.deepOrangeAccent,
          inactiveIconColor: Colors.white,
          animationDuration: Duration(milliseconds: 500),
          circleColor: Colors.white,
          backgroundColor: Colors.indigo,
          height: 100,
          items: <Items>[
            Items(
              icon: Icon(Icons.airline_seat_flat),
              tabName: 'Sleep',
              onClick: () {
                print('Sleep');
              },
            ),
            Items(
              icon: Icon(Icons.wifi_tethering),
              tabName: 'Wifi',
              onClick: () {
                print('Wifi');
              },
            ),
            Items(
              icon: Icon(Icons.adjust),
              tabName: 'Adjust',
              onClick: () {
                print('Adjust');
              },
            ),
            Items(
              icon: Icon(Icons.cake),
              tabName: 'Cake',
              onClick: () {
                print('Cake');
              },
            )
          ],
        ));
  }
}
