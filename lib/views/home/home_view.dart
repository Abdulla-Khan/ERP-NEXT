import 'package:erp_next/views/components/text_feilds.dart';
import 'package:erp_next/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: TabBar(

      // ),
      body: GetBuilder<HomeController>(
          init: Get.put<HomeController>(HomeController()),
          builder: (HomeController controller) {
            return DefaultTabController(
              length: 2,
              child: TabBar(tabs: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textFeild('Item Name', controller.itemName),
                      textFeild('Item Code', controller.itemCode),
                      textFeild('Item Description', controller.description),
                      ElevatedButton(
                          onPressed: () {
                            controller.sendItem();
                          },
                          child: const Text('Send Item'))
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textFeild('Item Name', controller.itemName),
                      textFeild('Item Code', controller.itemCode),
                      textFeild('Item Description', controller.description),
                      ElevatedButton(
                          onPressed: () {
                            controller.sendItem();
                          },
                          child: const Text('Send Item'))
                    ])
              ]),
            );
          }),
    );
  }
}
