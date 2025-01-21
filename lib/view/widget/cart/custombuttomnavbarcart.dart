import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/cart_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/view/widget/cart/custombuttomcart.dart';
import 'package:full_ecommerce/view/widget/cart/custombuttomcoupon.dart';
import 'package:get/get.dart';

class CustomButtomNavBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;

  final String totalprice;
  final TextEditingController controllerCoupon;
  final void Function()? onPressedApplyCoupon;
  const CustomButtomNavBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllerCoupon,
      this.onPressedApplyCoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponname == null
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllerCoupon,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                hintText: "82".tr,
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Expanded(
                            child: CustomButtomCoupon(
                          title: "81".tr,
                          onPressed: onPressedApplyCoupon,
                        ))
                      ]))
                  : Container(
                      child: Text("82 ${controller.couponname!}".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorApp.grey2,
                          )))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "77".tr,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "$price RY".tr,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "83".tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "$discount RY".tr,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "78".tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "$shipping RY".tr,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "79".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorApp.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$totalprice RY".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorApp.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          CustomButtomCart(
              title: "76".tr,
              onPressed: () {
                controller.goToPageCheckout();
              }),
        ],
      ),
    );
  }
}
