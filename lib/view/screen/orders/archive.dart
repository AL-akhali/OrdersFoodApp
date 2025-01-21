import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_ecommerce/controller/orders/archive_controller.dart';
import 'package:full_ecommerce/controller/orders/pending_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/data/model/ordersmodel.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:full_ecommerce/view/widget/orders/orderslistcard.dart';
import 'package:full_ecommerce/view/widget/orders/orderslistcardarchive.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    ArchiveController controller = Get.put(ArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: Text("109".tr),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: GetBuilder<ArchiveController>(
              builder: (controller) => HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CardOrdersListArchive(
                      ordersModel: controller.data[index],
                    ),
                  )),
            )));
  }
}
