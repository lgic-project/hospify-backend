import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend_new/UserData.dart';

import 'package:http/http.dart' as http;

class GetDataProvider with ChangeNotifier {
  Userdata responseData = Userdata();

  bool isLoading = false;

  getMyData() async {
    isLoading = true;
    responseData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<Userdata> getAllData() async {
    try {
      final response =
          await http.get(Uri.parse("http://127.0.0.1:8000/api/login"));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = Userdata.fromJson(item);
        notifyListeners();
      } else {
        print("else");
      }
    } catch (e) {
      log(e.toString());
    }

    return responseData;
  }
}
