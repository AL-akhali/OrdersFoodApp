import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/cart_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/view/widget/cart/custombuttomcart.dart';
import 'package:full_ecommerce/view/widget/cart/custombuttomnavbarcart.dart';
import 'package:full_ecommerce/view/widget/cart/customitemscartlist.dart';
import 'package:full_ecommerce/view/widget/cart/topcardcart.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => CustomButtomNavBarCart(
                  price: "${cartController.priceorder} RY",
                  discount: "10%",
                  shipping: "${controller.discountcoupon}%",
                  totalprice: "${controller.getTotalPrice()} RY",
                  controllerCoupon: controller.controllerCoupon!,
                  onPressedApplyCoupon: () {
                    controller.checkCoupon();
                  },
                )),
        appBar: AppBar(
          title: Text("75".tr),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      TopCardCart(
                          text:
                              "انت لديك ${cartController.totalcountitems} من المنتجات"),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartController.data.length,
                              (index) => CustomItemsCartList(
                                onAddPressed: () async {
                                  await cartController.addItems(cartController
                                      .data[index].itemsId!
                                      .toString());
                                  cartController.refreshPage();
                                },
                                onRemovePressed: () async {
                                  await cartController.deleteItems(
                                      cartController.data[index].itemsId!
                                          .toString());
                                  cartController.refreshPage();
                                },
                                title:
                                    "${cartController.data[index].itemsNameAr}",
                                price:
                                    "${cartController.data[index].totalitemsprice}",
                                count:
                                    "${cartController.data[index].countitems}",
                                imagename:
                                    "${cartController.data[index].itemsImage}",
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
