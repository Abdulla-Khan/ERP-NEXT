import 'package:erp_next/views/components/text_feilds.dart';
import 'package:erp_next/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(
                indicatorColor: Colors.black,
                indicatorWeight: 2,
                tabs: [
                  Tab(
                    child: Text('Add Item',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                  Tab(
                    child: Text('Add Customer',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ],
              ),
              Expanded(
                child: GetBuilder<HomeController>(
                    init: Get.put<HomeController>(HomeController()),
                    builder: (HomeController controller) {
                      return TabBarView(children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              textFeild('Item Name', controller.itemName),
                              textFeild('Item Code', controller.itemCode),
                              textFeild(
                                  'Item Description', controller.description),
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
                              textFeild(
                                  'Customer Name', controller.customerName),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.sendCustomer();
                                  },
                                  child: const Text('Send Customer'))
                            ])
                      ]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
