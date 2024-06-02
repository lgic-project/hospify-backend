import 'package:flutter/material.dart';
import 'package:frontend/controller/dccontroller.dart';
import 'package:provider/provider.dart';

class ProfileSCreen extends StatefulWidget {
  const ProfileSCreen({super.key});

  @override
  State<ProfileSCreen> createState() => _ProfileSCreenState();
}

class _ProfileSCreenState extends State<ProfileSCreen> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<DocDataProvider>(context, listen: false);
    dataProvider.getMyData();
  }

  @override
  Widget build(BuildContext context) {
    final docProvider = Provider.of<DocDataProvider>(context);

    final List<Map<String, String>> patientBookings = [
      {"time": "09:30 AM", "name": "Ram Bahadur"},
      // Add more bookings here if needed
    ];
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        docProvider.docData.data?.fname.toString() ?? "N/A",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/image/doctor3.jpg'),
                  ),
                ],
              ),
            ),
            Text(
              'Today meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: patientBookings.length,
                itemBuilder: (context, index) {
                  final booking = patientBookings[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking['name']!,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          booking['time']!,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
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
