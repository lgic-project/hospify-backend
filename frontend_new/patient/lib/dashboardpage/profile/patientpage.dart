import 'package:flutter/material.dart';
import '../profile.dart';
import 'prescriptionpage.dart';
import 'medicalrecordpage.dart';
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
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              ); // Handle edit profile action
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileOption('Prescription', Icons.description, Colors.green, context),
                      _buildProfileOption('Medical Record', Icons.medical_services, Colors.blue, context),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileOption('Appointment', Icons.calendar_today, Colors.purple, context),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  _buildProfileListOption('Settings', Icons.settings, Colors.red, context),
                  _buildProfileListOption('Sign Out', Icons.logout, Colors.red, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, IconData icon, Color color, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navigate to the respective page based on the title
          if (title == 'Prescription') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrescriptionPage()),
            );
          } else if (title == 'Medical Record') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedicalRecordPage()),
            );
          }  
        },
        child: Container(
          height: 100,
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 172, 186, 91),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 36, 40, 226).withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8.0),
              Text(title, style: const TextStyle(fontSize: 16.0)),
            ],
          ),
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
