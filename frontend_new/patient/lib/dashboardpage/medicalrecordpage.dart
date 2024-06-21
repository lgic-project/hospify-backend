import 'package:flutter/material.dart';

class MedicalRecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Record'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/medicalrecords.png', 
              width: 300,
              height: 300,
            ),
            SizedBox(height: 16),
            Text(
              'No medical records available',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 100),
            ElevatedButton.icon(
              onPressed: () {
                // Implement the logic to upload an image
                // For simplicity, let's navigate to a hypothetical UploadImagePage
                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImagePage()));
              },
              icon: Icon(Icons.cloud_upload, size: 100),
              label: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Text('Implement your image upload functionality here'),
      ),
    );
  }
}
