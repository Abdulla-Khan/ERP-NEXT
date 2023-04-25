import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController itemName = TextEditingController();
  TextEditingController itemCode = TextEditingController();
  TextEditingController itemGroup = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController customerName = TextEditingController();
  var a = Get.arguments;
  @override
  onInit() {
    print(a);
    super.onInit();
  }

  sendCustomer() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; $a; system_user=yes; user_id=Administrator; user_image='
    };
    var request = http.Request(
        'POST', Uri.parse('http://demo.cubezix.com:85/api/resource/Customer'));
    request.body = json.encode({
      "customer_name": customerName.text,
      "customer_group": "Individual",
      "customer_type": "Company",
      "company": "Square Zix Digital Marketing",
      "territory": "United Arab Emirates"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      customerName.clear();
    } else {
      print(response.reasonPhrase);
    }
  }

  sendItem() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; $a; system_user=yes; user_id=Administrator; user_image='
    };
    var request = http.Request(
        'POST', Uri.parse('http://demo.cubezix.com:85/api/resource/Item'));
    request.body = json.encode({
      "item_name": itemName.text,
      "item_code": itemCode.text,
      "item_group": "All Item Groups",
      "description": description.text,
      "default_warehouse": "Stores - VAR",
      "is_stock_item": 1,
      "is_sales_item": 1,
      "is_purchase_item": 1,
      "has_serial_no": 0
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      itemCode.clear();
      itemName.clear();
      description.clear();
    } else {
      print(response.reasonPhrase);
    }
  }
}
// Testing Item 001
// Testing Item Code 001
// Testing Item Description 001

// Administrator
// cubezix@2023
// All Item Groups