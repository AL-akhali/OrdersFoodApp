import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/orders/archive_controller.dart';
import 'package:full_ecommerce/controller/orders/pending_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/data/model/ordersmodel.dart';
import 'package:full_ecommerce/view/widget/orders/ratingdialog.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<ArchiveController> {
  final OrdersModel ordersModel;
  const CardOrdersListArchive({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              "111".tr,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "   ${ordersModel.ordersId}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          "${Jiffy.parse(ordersModel.ordersDate!).format(pattern: 'MMMM do yyyy, h:mm:ss a')}",
        ),
        Divider(),
        Row(
          children: [
            Text("112".tr),
            Text(
                "   ${controller.printOrderType(ordersModel.ordersType.toString())}"),
          ],
        ),
        Row(
          children: [
            Text("113".tr),
            Text("   ${ordersModel.ordersPrice}"),
          ],
        ),
        Row(
          children: [
            Text("114".tr),
            Text("   ${ordersModel.ordersPricedelivery}"),
          ],
        ),
        Row(
          children: [
            Text("115".tr),
            Text(
                "  ${controller.printPaymentMethod(ordersModel.ordersPaymentsmethod!.toString())}"),
          ],
        ),
        Row(
          children: [
            Text("120".tr),
            Text(
                "  ${controller.printOrderStatus(ordersModel.ordersStatus!.toString())}"),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text("116".tr,
                style: TextStyle(
                    color: ColorApp.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Text("  ${ordersModel.ordersTotalprice}",
                style: TextStyle(
                    color: ColorApp.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: ColorApp.thirdColor,
              onPressed: () {
                Get.toNamed(AppRoute.ordersDetails,
                    arguments: {"ordersmodel": ordersModel});
              },
              child: Text("103".tr),
            ),
            SizedBox(
              width: 5,
            ),
            if (ordersModel.ordersRating == 0)
              MaterialButton(
                color: ColorApp.thirdColor,
                onPressed: () {
                  showDialogRating(context, ordersModel.ordersId.toString());
                },
                child: Text("127".tr),
              ),
          ],
        )
      ]),
    ));
  }
}
