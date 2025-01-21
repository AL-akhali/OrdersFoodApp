import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/orders/details_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController controller = Get.put(DetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("122".tr),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<DetailsController>(
              builder: (controller) => HandlingData(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          children: [
                            TableRow(children: [
                              Text(
                                "123".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorApp.secoundColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "124".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorApp.secoundColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "125".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorApp.secoundColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                Text(
                                  "${controller.data[index].itemsNameAr}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].countitems}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].itemsPrice}",
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "79".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorApp.secoundColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          " : ${controller.ordersModel.ordersTotalprice}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorApp.secoundColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (controller.ordersModel.ordersType == 0)
                      Card(
                        child: Container(
                          child: ListTile(
                            title: Text(
                              "90".tr,
                              style: TextStyle(
                                  color: ColorApp.secoundColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "${controller.ordersModel.addressCity} -- ${controller.ordersModel.addressStreet} -- ${controller.ordersModel.addressDetails}"),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )));
  }
}
