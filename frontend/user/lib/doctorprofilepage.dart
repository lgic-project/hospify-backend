import 'package:flutter/material.dart';

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
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add more profile details here
          ],
        ),
      ),
    );
  }
}
