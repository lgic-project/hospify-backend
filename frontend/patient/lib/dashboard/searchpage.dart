import 'package:flutter/material.dart';



//  SizedBox(height: 16.0),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: 'Search by keyword',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                               borderSide: BorderSide.none,
//                             ),
//                             prefixIcon: Icon(Icons.search),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 20.0),
                     
//                     ],
//                   ),
//                 ],
//               ),
//             ),






class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          // Location selection
          DropdownButton<String>(
            // Populate with districts of Nepal
            items: <String>[
              'District 1',
              'District 2',
              // Add more districts...
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle district selection
            },
          ),
          // Service type selection
          DropdownButton<String>(
            // Populate with service types
            items: <String>[
              'Hospital',
              'Doctor',
              'Clinic',
              // Add more service types...
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle service type selection
            },
          ),
          // Search button
          ElevatedButton(
            onPressed: () {
              // Perform search
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResultsPage()),
              );
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }
}

// SearchResultsPage widget
class SearchResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Center(
        child: Text('Display search results here'),
      ),
    );
  }
}
