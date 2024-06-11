import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigate to the search page or show search bar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Searchpage()), // Fixed the class name here
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}

class Searchpage extends StatefulWidget {
  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
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
                    onChanged: (String? newValue) { // Allow null
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
                    onChanged: (String? newValue) { // Allow null
                      setState(() {
                        selectedLocation = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Example item count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Search Result ${index + 1}'),
                  );
                },
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Icon(Icons.insert_drive_file, size: 80, color: Colors.grey),
                  SizedBox(height: 16.0),
                  Text(
                    'Search Title',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('0 result found'),
                  SizedBox(height: 16.0),
                  Text('No Data found', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}