import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/notification_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          title: Text("121".tr),
        ),
        body: GetBuilder<NotificationController>(
            builder: (controller) => HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: ColorApp.secoundColor, width: 10)),
                    child: ListView(
                      children: [
                        ...List.generate(
                          controller.data.length,
                          (index) => ListTile(
                            dense: true,
                            title: Text(
                                controller.data[index]['notification_title']),
                            subtitle: Text(
                                controller.data[index]['notification_body']),
                            trailing: Text(
                                controller.data[index]['notification_date']),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                )));
  }
}
