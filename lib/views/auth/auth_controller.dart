import 'package:erp_next/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    Map<String, String> headers = {};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://demo.cubezix.com:85/api/method/login?usr=${userName.text}&pwd=${password.text}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String? rawCookie = response.headers['set-cookie'];
      if (rawCookie != null) {
        int index = rawCookie.indexOf(';');
        headers['cookie'] =
            (index == -1) ? rawCookie : rawCookie.substring(0, index);
      }
      // print();
      Get.offAll(() => HomeView(), arguments: headers['cookie']);
    } else {
      print(response.reasonPhrase);
    }
  }
}
// Administrator
// cubezix@2023