import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/Patientmodel/Paview.dart';

import 'package:http/http.dart' as http;

class PaDataProvider with ChangeNotifier {
  PaaccModel patientData = PaaccModel();

  bool isLoading = false;

  getMyData() async {
    isLoading = true;
    patientData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<PaaccModel> getAllData() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.1.64:8000/api/paview-detail/1"));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        patientData = PaaccModel.fromJson(item);
        notifyListeners();
      } else {
        print("else");
      }
    } catch (e) {
      log(e.toString());
    }

    return patientData;
  }
}
