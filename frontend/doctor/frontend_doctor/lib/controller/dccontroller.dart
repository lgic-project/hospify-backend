// import 'dart:developer';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:frontend/models/dcview.dart';

// import 'package:http/http.dart' as http;

// class DocDataProvider with ChangeNotifier {
//   dcdetailsmodel docData = dcdetailsmodel();

//   bool isLoading = false;

//   getMyData() async {
//     isLoading = true;
//     notifyListeners();
//     responseData = await getAllData();
//     isLoading = false;
//     notifyListeners();
//   }

//   Future<dcdetailsmodel> getAllData() async {
//     try {
//       final response = await http
//           .get(Uri.parse("http://192.168.1.64:8000/api/dcview-detail/1"));
//       if (response.statusCode == 200) {
//         final item = json.decode(response.body);
//         responseData = dcdetailsmodel.fromJson(item);
//       } else {
//         log("Failed to load data: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error fetching data: $e");
//     }
//     return responseData;
//   }
// }

import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/models/dcview.dart';
import 'package:http/http.dart' as http;

class DocDataProvider with ChangeNotifier {
  dcdetailsmodel docData = dcdetailsmodel();

  bool isLoading = false;

  getMyData() async {
    isLoading = true;
    docData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<dcdetailsmodel> getAllData() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.1.64:8000/api/dcview-detail/1"));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        docData = dcdetailsmodel.fromJson(item);
        notifyListeners();
      } else {
        print("else");
      }
    } catch (e) {
      log(e.toString());
    }

    return docData;
  }
}
