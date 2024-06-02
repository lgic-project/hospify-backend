import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:frontend/controller/dccontroller.dart';
import 'package:frontend/views/ProfilePage.dart';
import 'package:frontend/views/notificationScreen.dart';
import 'package:frontend/views/settings.dart';

import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
// yo pani bottom nav bhitra huncha
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ProfileSCreen(),
    SettingScrren(),
    Notificationscreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1 || index == 2) {
      // Navigate to a new dashboard for settings and notifications
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewDashboardPage(
            title:
                index == 1 ? 'Settings Dashboard' : 'Notifications Dashboard',
            content: _widgetOptions[index],
          ),
        ),
      ).then((value) {
        // This block executes when returning from the NewDashboardPage
        setState(() {
          _selectedIndex = 0; // Return to ProfilePage after navigating back
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),

            // bottomnav bar ko lagi diiferent file banau ani tyo profile ,setting and notification
            BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              onTap: _onItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}

class NewDashboardPage extends StatelessWidget {
  final String title;
  final Widget content;

  NewDashboardPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
