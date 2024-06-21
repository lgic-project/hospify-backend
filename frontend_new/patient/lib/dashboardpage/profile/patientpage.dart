import 'package:flutter/material.dart';
import '../dashboardpage.dart';
import '../profile.dart';
import 'settingpage.dart';
import 'signoutpage.dart';


void main() {
  runApp(MaterialApp(
    home: PatientPage(),
  ));
}

class PatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()), // Navigate back to the dashboard
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: const Column(
                children: [
                  SizedBox(height: 10.0),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/image/doctor.jpg'), // Add your avatar image path
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Ram bahadur',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  _buildProfileListOption('Settings', Icons.settings, Colors.red, context),
                     _buildProfileListOption('Sign Out', Icons.logout, Colors.red, context),                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileListOption(String title, IconData icon, Color color, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 41, 9, 226)),
      onTap: () {
        // Navigate to the respective page based on the title
        if (title == 'Settings') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        } else if (title == 'Sign Out') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignOutPage()),
          );
        }
      },
    );
  }
}
