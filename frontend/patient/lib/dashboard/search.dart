import 'package:flutter/material.dart';

import 'appoinmentpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

class Doctor {
  final String name;
  final String specialization;
  final int experience;
  final double fee;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.fee,
    required this.imageUrl,
  });
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Darshan Ghale',
      specialization: 'Internal Medicine',
      experience: 5,
      fee: 850,
      imageUrl: 'assets/image/doctor.jpg', // Replace with actual image URLs
    ),
    Doctor(
      name: 'Dr. Safal Koirala',
      specialization: 'Internal Medicine',
      experience: 5,
      fee: 1000,
      imageUrl: 'assets/image/doctor1.jpg',
    ),
    Doctor(
      name: 'Dr. Kiran Sunar',
      specialization: 'Internal Medicine',
      experience: 2,
      fee: 850,
      imageUrl: 'assets/image/doctor2.jpg',
    ),
     Doctor(
      name: 'Dr. Kiran Sunar',
      specialization: 'Internal Medicine',
      experience: 2,
      fee: 850,
      imageUrl: 'assets/image/doctor3.jpg',
    ),
     Doctor(
      name: 'Dr. Kiran Sunar',
      specialization: 'Internal Medicine',
      experience: 2,
      fee: 850,
      imageUrl: 'assets/image/doctor4.jpg',
    ),
     Doctor(
      name: 'Dr. Kiran Sunar',
      specialization: 'Internal Medicine',
      experience: 2,
      fee: 850,
      imageUrl: 'assets/image/doctor5.jpg',
    ),
    // Add more doctor entries here
  ];

  String selectedCategory = 'Doctor';
  String? selectedLocation;
  final List<String> categories = [
    'Hospital',
    'Doctor',
    'Blog',
    'Pharmaceutical',
    'Ambulance',
    'Clinic',
    'Service',
    'Package',
    'Medicine'
  ];

  final List<String> districts = [
    'Achham', 'Arghakhanchi', 'Baglung', 'Baitadi', 'Bajhang', 'Bajura', 'Banke', 
    'Bara', 'Bardiya', 'Bhaktapur', 'Bhojpur', 'Chitwan', 'Dadeldhura', 'Dailekh', 
    'Dang', 'Darchula', 'Dhading', 'Dhankuta', 'Dhanusa', 'Dolakha', 'Dolpa', 
    'Doti', 'Eastern Rukum', 'Gorkha', 'Gulmi', 'Humla', 'Ilam', 'Jajarkot', 'Jhapa', 
    'Jumla', 'Kailali', 'Kalikot', 'Kanchanpur', 'Kapilvastu', 'Kaski', 'Kathmandu', 
    'Kavrepalanchok', 'Khotang', 'Lalitpur', 'Lamjung', 'Mahottari', 'Makwanpur', 
    'Manang', 'Morang', 'Mugu', 'Mustang', 'Myagdi', 'Nawalpur', 'Nuwakot', 
    'Okhaldhunga', 'Palpa', 'Panchthar', 'Parasi', 'Parbat', 'Parsa', 'Pyuthan', 
    'Ramechhap', 'Rasuwa', 'Rautahat', 'Rolpa', 'Rupandehi', 'Salyan', 'Sankhuwasabha', 
    'Saptari', 'Sarlahi', 'Sindhuli', 'Sindhupalchok', 'Siraha', 'Solukhumbu', 
    'Sunsari', 'Surkhet', 'Syangja', 'Tanahun', 'Taplejung', 'Tehrathum', 'Udayapur', 
    'Western Rukum'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Implement back button functionality
          },
        ),
        backgroundColor: Colors.blue, // Ensure the AppBar background color is consistent
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Search By Keyword',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCategory,
                    items: categories.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Select Location'),
                    value: selectedLocation,
                    items: districts.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLocation = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailPage(doctor: doctors[index]),
                        ),
                      );
                    },
                    child: DoctorCard(doctor: doctors[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(doctor.imageUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(doctor.specialization),
                  Text('Experience: ${doctor.experience} years'),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  'Rs. ${doctor.fee}',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentPage(doctor: doctor),
                      ),
                    );
                  },
                  child: Text('Book Appointment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class DoctorDetailPage extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailPage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(doctor.imageUrl),
            ),
            SizedBox(height: 20.0),
            Text(
              'Name: ${doctor.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Specialization: ${doctor.specialization}'),
            Text('Experience: ${doctor.experience} years'),
            Text('Fee: Rs. ${doctor.fee}'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentPage(doctor: doctor),
                  ),
                );
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
