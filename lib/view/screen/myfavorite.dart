import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/myfavorite_controller.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/view/widget/customappbar.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:full_ecommerce/view/widget/myfavorite/customlistfavorite.dart';
import 'package:get/get.dart';

class MyfavoriteScreen extends StatelessWidget {
  const MyfavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "64".tr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(children: [
              HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        return CustomListFavoriteItems(
                          favoriteModel: controller.data[index],
                        );
                      }))
            ]),
          ),
        ));
  }
}
