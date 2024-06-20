import 'package:flutter/material.dart';

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

  void _updateProfile(String newName, String newDob, String newGender, String newLocation, String newEmail) {
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
              child: Text('Update Information'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
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

class EditProfilePage extends StatefulWidget {
  final String name;
  final String dob;
  final String gender;
  final String location;
  final String email;
  final Function(String, String, String, String, String) onSave;

  EditProfilePage({
    required this.name,
    required this.dob,
    required this.gender,
    required this.location,
    required this.email,
    required this.onSave,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _dobController;
  late TextEditingController _genderController;
  late TextEditingController _locationController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _dobController = TextEditingController(text: widget.dob);
    _genderController = TextEditingController(text: widget.gender);
    _locationController = TextEditingController(text: widget.location);
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(_nameController, 'Name'),
            _buildTextField(_dobController, 'Date of Birth'),
            _buildTextField(_genderController, 'Gender'),
            _buildTextField(_locationController, 'Location'),
            _buildTextField(_emailController, 'Email'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onSave(
                  _nameController.text,
                  _dobController.text,
                  _genderController.text,
                  _locationController.text,
                  _emailController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
