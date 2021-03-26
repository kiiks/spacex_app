import 'package:flutter/material.dart';
import 'package:spaceX_app/View/history.dart';
import 'package:spaceX_app/View/map.dart';
import 'package:spaceX_app/View/upcoming_launches.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    UpcomingLaunches(),
    History(),
    Map()
  ];

  void _onBottomItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_not_fixed_outlined),
            label: 'Next Launches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Launches History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onBottomItemTap,
      ),
    );
  }
}
