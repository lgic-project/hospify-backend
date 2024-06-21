import 'package:flutter/material.dart';
import 'editprofilepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Ram Bahadur';
  String dob = '2005/01/01';
  String gender = 'Male';
  String location = 'Pokhara';
  String email = 'ram@gmail.com';

  void _updateProfile(String newName, String newDob, String newGender,
      String newLocation, String newEmail) {
    setState(() {
      name = newName;
      dob = newDob;
      gender = newGender;
      location = newLocation;
      email = newEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _buildProfileInfoRow(Icons.person, name),
            _buildProfileInfoRow(Icons.calendar_today, dob),
            _buildProfileInfoRow(Icons.male, gender),
            _buildProfileInfoRow(Icons.location_on, location),
            _buildProfileInfoRow(Icons.email, email),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      name: name,
                      dob: dob,
                      gender: gender,
                      location: location,
                      email: email,
                      onSave: _updateProfile,
                    ),
                  ),
                );
              },
              child: Text('update Information'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
