import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ProfilePage(),
    SettingsPage(),
    NotificationsPage(),
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
          title: index == 1 ? 'Settings Dashboard' : 'Notifications Dashboard',
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
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(30.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Dr. Darshana',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/image/doctor3.jpg'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
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

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample list of patient bookings
    final List<Map<String, String>> patientBookings = [
      {"time": "09:30 AM", "name": "Ram Bahadur"},
      // Add more bookings here if needed
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: patientBookings.length,
              itemBuilder: (context, index) {
                final booking = patientBookings[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking['name']!,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        booking['time']!,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Account'),
          onTap: () {
            // Handle account tap
          },
        ),
        
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Privacy'),
          onTap: () {
            // Handle privacy tap
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            // Handle logout tap
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Logout'),
                  content: Text('Are you sure you want to logout?'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Logout'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Perform logout operation here
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}


class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No new notifications',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.grey,
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
