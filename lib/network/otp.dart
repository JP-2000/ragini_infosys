import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Otp {
  static var correctOtp;
  static Future<void> getOtp(String username) async {
    String url = "https://charzup.niharexpress.com/api/appApi";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"key": "6997c339387ac79b5fec7676cd6170b0d8b1e79c"},
        body: {"method": "getOtp", "username": "8108017849"},
      );
      debugPrint(json.decode(response.body).toString());
      final Map<String, dynamic> responseMap = json.decode(response.body);
      final otp = responseMap['response']['data']['otp'].toString();
      Otp.correctOtp = otp;
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static Future<bool> verifyOtp(String enterdOtp, String username) async {
    String url = "https://charzup.niharexpress.com/api/appApi";
    try {
      debugPrint(Otp.correctOtp);
      debugPrint(username);
      final response = await http.post(
        Uri.parse(url),
        headers: {"key": "de8e1fe4f88311a3ae02da0ca159e6f6aeeb1124"},
        body: {"method": "varifyOtp", "username": username, "otp": enterdOtp},
      );
      debugPrint(json.decode(response.body).toString());
      final responseMap = json.decode(response.body);
      final msg = responseMap['response']['msg'];
      if (msg == "SUCCESS") {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }
}
