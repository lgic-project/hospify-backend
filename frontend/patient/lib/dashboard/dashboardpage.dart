import 'package:flutter/material.dart';
import 'profile.dart';
import 'profile/settingpage.dart';
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
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   // elevation: 0,
      //   // actions: const [
      //     // IconButton(
      //     //   icon: Icon(Icons.notifications, color: Colors.white),
      //     //   onPressed: () {
      //     //     Navigator.push(
      //     //       context,
      //     //       MaterialPageRoute(builder: (context) => NotificationsPage()),
      //     //     );
      //     //   },
      //     // ),
      //   // ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with User Info and Search
            Container(
              padding: EdgeInsets.all(25.0),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Hi, Ram',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Do you have any health issue?',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.blue,
                          iconSize: 45,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage()),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.person, color: Colors.white),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Carousel Section
            SizedBox(height: 3.0),
            CarouselSlider(
              options: CarouselOptions(
                height: 110.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 19 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 600),
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
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
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
            // Additional content can be added here
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
              MaterialPageRoute(builder: (context) => PatientPage()),
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
}
