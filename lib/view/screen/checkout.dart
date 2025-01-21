import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/checkout_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/view/widget/cart/custombuttomcart.dart';
import 'package:full_ecommerce/view/widget/checkout/cardaddressplace.dart';
import 'package:full_ecommerce/view/widget/checkout/carddeliverytype.dart';
import 'package:full_ecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: Text("84".tr),
        ),
        bottomNavigationBar: CustomButtomCart(
            title: "84".tr,
            onPressed: () {
              controller.checkout();
            }),
        body: GetBuilder<CheckOutController>(
          builder: (controller) => Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Text(
                  "85".tr,
                  style: TextStyle(
                    color: ColorApp.secoundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // طريقة الدفع
                InkWell(
                  onTap: () {
                    controller.choosePaymentsMethod("0"); // 0 => Cash
                  },
                  child: CardPaymentMethod(
                      text: "86".tr,
                      isActive: controller.paymentMethod == "0" ? true : false),
                ),
                InkWell(
                  onTap: () {
                    controller.choosePaymentsMethod("1"); //1 => Card
                  },
                  child: CardPaymentMethod(
                      text: "87".tr,
                      isActive: controller.paymentMethod == "1" ? true : false),
                ),
                Text(
                  "88".tr,
                  style: TextStyle(
                    color: ColorApp.secoundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("0"); // 0 => delivery
                      },
                      child: CardDeliveryType(
                        text: "89".tr,
                        active: controller.deliveryType == "0" ? true : false,
                        imagename: ImagesAsset.DeliveryImage,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("1"); // 1 => recive
                      },
                      child: CardDeliveryType(
                        text: "93".tr,
                        active: controller.deliveryType == "1" ? true : false,
                        imagename: ImagesAsset.ReciveImage,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if (controller.deliveryType == '0')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "90".tr,
                        style: TextStyle(
                          color: ColorApp.secoundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      if (controller.dataaddress.isEmpty)
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.addressAdd);
                          },
                          child: Center(
                            child: Text(
                              "132".tr,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                        controller.dataaddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(controller
                                .dataaddress[index].addressId!
                                .toString());
                          },
                          child: CardAddressPlace(
                              text:
                                  "${controller.dataaddress[index].addressName}",
                              body:
                                  "${controller.dataaddress[index].addressCity} -- ${controller.dataaddress[index].addressStreet} -- ${controller.dataaddress[index].addressDetails}",
                              active: controller.addressid ==
                                      controller.dataaddress[index].addressId
                                          .toString()
                                  ? true
                                  : false),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
