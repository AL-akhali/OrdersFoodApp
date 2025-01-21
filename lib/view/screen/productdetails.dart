import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_ecommerce/controller/productdetails_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:full_ecommerce/view/widget/productsdDetails/priceandcount.dart';
import 'package:full_ecommerce/view/widget/productsdDetails/stackproduct.dart';
import 'package:full_ecommerce/view/widget/productsdDetails/subitemslist.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: ColorApp.secoundColor,
            onPressed: () {
              controller.cartController.refreshPage();
              Get.toNamed(AppRoute.cartScreen);
            },
            child: Text(
              "69".tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingData(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    // صورة المنتج
                    StackProduct(),
                    SizedBox(
                      height: 100,
                    ),
                    // العنوان
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                          translateDatabase(
                              "${controller.itemsModel.itemsNameAr}",
                              "${controller.itemsModel.itemsName}"),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: ColorApp.secoundColor)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // السعر والكمية
                          PriceAndCount(
                              onPressedIconAdd: () {
                                controller.cartController.addItems(
                                    controller.itemsModel.itemsId!.toString());
                                controller.add();
                              },
                              onPressedIconRemove: () {
                                controller.cartController.deleteItems(
                                    controller.itemsModel.itemsId!.toString());
                                controller.remove();
                              },
                              count: "${controller.countitems}",
                              price:
                                  "${controller.itemsModel.itemsPriceDiscount}\RY"),
                          // الوصف
                          Text(
                              translateDatabase(
                                  "${controller.itemsModel.itemsDescAr}",
                                  "${controller.itemsModel.itemsDesc}"),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: ColorApp.grey2)),
                          SizedBox(
                            height: 10,
                          ),
                          // Text("65".tr,
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .displayLarge!
                          //         .copyWith(color: ColorApp.secoundColor)),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // الالوان
                          // SubItemsList(),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
