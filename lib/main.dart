import 'package:flutter/material.dart';
import 'package:week2_project/project/bmi.dart';
import 'package:week2_project/project/calc.dart';
import 'package:week2_project/project/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Submission Udacoding Week 2',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onNavbarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  final _listPage = [
    LoginPage(),
    Calculator(),
    BMI(),
  ];

  final _bottomNavbarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.lock_open),
      activeIcon: Icon(Icons.lock),
      title: Text('Login Page'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.exposure_neg_2),
      activeIcon: Icon(Icons.exposure_plus_2),
      title: Text('Calculator'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_outline),
      activeIcon: Icon(Icons.people),
      title: Text('BMI'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final _bottomNavigationBar = BottomNavigationBar(
      items: _bottomNavbarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onNavbarTapped,
    );

    return Scaffold(
      body: _listPage[_selectedTabIndex],
      bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
