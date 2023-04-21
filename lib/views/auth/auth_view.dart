import 'package:erp_next/views/auth/auth_controller.dart';
import 'package:erp_next/views/components/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthController> {
  AuthView({super.key});
  var controlsler = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textFeild('UserName', controlsler.userName),
          textFeild('Password', controlsler.password),
          ElevatedButton(
              onPressed: () => controlsler.login(), child: const Text('Login'))
        ],
      ),
    );
  }
}
// Administrator
// cubezix@2023
