import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'notification.dart';
import 'setting.dart';

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Dashboard'),
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with User Info and Search
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User id: 001',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Hi, Ram',
                            style: TextStyle(color: Colors.white, fontSize: 24.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Do you have any health complaints?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.person, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePage(
                              doctorName: 'Ram Bahadur', // Your user profile name
                              doctorImage: 'assets/image/user_profile.jpg', // Your user profile image
                            )),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Available Doctors Section
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Available Doctors',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildDoctorAvatar(context, 'Dr. John Doe', 'assets/image/doctor.jpg'),
                  _buildDoctorAvatar(context, 'Dr. Jane Smith', 'assets/image/doctor1.jpg'),
                  _buildDoctorAvatar(context, 'Dr. Bob Brown', 'assets/image/doctor2.jpg'),
                  _buildDoctorAvatar(context, 'Dr. Alice Green', 'assets/image/doctor3.jpg'),
                  _buildDoctorAvatar(context, 'Dr. Charlie White', 'assets/image/doctor4.jpg'),
                  _buildDoctorAvatar(context, 'Dr. Dave Black', 'assets/image/doctor5.jpg'),
                ],
              ),
            ),
            // Services Section
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Our Services',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildServiceCard('General practice', Icons.local_hospital),
                _buildServiceCard('Internal Medicine', Icons.healing),
                _buildServiceCard('Cardiology', Icons.favorite),
                _buildServiceCard('Psychiatric', Icons.person),
                _buildServiceCard('Pediatrics', Icons.child_care),
                _buildServiceCard('Dermatology', Icons.face),
                _buildServiceCard('Gynaecology', Icons.pregnant_woman),
                _buildServiceCard('Gastroenterology', Icons.local_dining),
                _buildServiceCard('Orthopedic', Icons.accessibility),
                _buildServiceCard('Dermatology', Icons.brush),
                _buildServiceCard('Hertology', Icons.favorite_border),
                _buildServiceCard('Psychiatric', Icons.psychology),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(
                doctorName: 'Ram Bahadur', // Your user profile name
                doctorImage: 'assets/image/user_profile.jpg', // Your user profile image
              )),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildDoctorAvatar(BuildContext context, String doctorName, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => doctorprofilePage(
              doctorName: doctorName,
              doctorImage: imagePath,
              specialization: 'Specialization', // Update with actual specialization
            )),
          );
        },
        child: CircleAvatar(
          radius: 35.0,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

doctorprofilePage({required String doctorName, required String doctorImage, required String specialization}) {
}

class ProfilePage extends StatelessWidget {
  final String doctorName;
  final String doctorImage;

  ProfilePage({required this.doctorName, required this.doctorImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(doctorImage, width: 150, height: 150), // Update this line to match the path type (network or asset)
            SizedBox(height: 20),
            Text(
              doctorName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add more profile details here
          ],
        ),
      ),
    );
  }
}