import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/test_controller.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(title: Text("Title")),
        body: GetBuilder<TestController>(builder: (controller) {
          return HandlingData(statusRequest: controller.statusRequest,
              widget:
              ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Text("${controller.data}");
                  }));
        }));
  }
}
