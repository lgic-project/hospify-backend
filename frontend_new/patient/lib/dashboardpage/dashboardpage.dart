import 'package:flutter/material.dart';
import 'profile.dart';
import 'profile/Bookappoinment.dart';
import 'profile/medicalrecordpage.dart';
import 'profile/prescriptionpage.dart';
import 'search.dart';
import 'profile/patientpage.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with User Info and Search
            Container(
              padding: const EdgeInsets.all(25.0),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Ram',
                            style: TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        padding: const EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.search),
                          color: Colors.blue,
                          iconSize: 45,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SearchPage()),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.person, color: Colors.white),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfilePage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Carousel Section
            const SizedBox(height: 3.0),
            CarouselSlider(
              options: CarouselOptions(
                height: 140.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 19 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 600),
                viewportFraction: 0.8,
              ),
              items: [
                'assets/image/slider.jpg', // Add your image paths here
                'assets/image/slider1.jpg',
                'assets/image/slider2.jpg',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileOption('Appointment', Icons.calendar_today, Colors.purple, context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileOption('Medical Record', Icons.medical_services, Colors.blue, context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileOption('Prescription', Icons.description, Colors.green, context),
                    ],
                  ),
                ],
              ),
            ), // Additional content can be added here
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
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientPage()),
            );
          }
        },
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
          } else if (title == 'Appointment') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()), // Navigate to the SearchPage
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
}
