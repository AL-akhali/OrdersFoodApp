import 'dart:io';

import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/homescreen_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/view/widget/home/custombuttonappbarhome.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: ColorApp.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cartScreen);
                },
                child: Icon(Icons.shopping_basket_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomButtonAppbarHome(),
              body: WillPopScope(
                  child: controller.ListPage.elementAt(controller.currentpage),
                  onWillPop: () {
                    Get.defaultDialog(
                        title: "44".tr,
                        middleText: "45".tr,
                        onCancel: () {},
                        onConfirm: () {
                          exit(0);
                        });

                    return Future.value(false);
                  }),
            ));
  }
}
