import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/models/padetails.dart';

import 'package:http/http.dart' as http;

class GetDataProvider with ChangeNotifier {
  padetailsmodel responseData = padetailsmodel();

  bool isLoading = false;

  getMyData() async {
    isLoading = true;
    notifyListeners();
    responseData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<padetailsmodel> getAllData() async {
    try {
      final response =
          await http.get(Uri.parse("http://192.168.1.64:8000/api/paview"));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = padetailsmodel.fromJson(item);
      } else {
        log("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching data: $e");
    }
    return responseData;
  }
}
