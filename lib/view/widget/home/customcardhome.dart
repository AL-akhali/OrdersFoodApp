import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/home_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
            subtitle: Text(
              body,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          height: 150,
          decoration: BoxDecoration(
              color: ColorApp.primaryColor,
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
            top: -20,
            right: controller.lang == "ar" ? 200 : null,
            left: controller.lang == "en" ? 200 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: ColorApp.secoundColor,
                  borderRadius: BorderRadius.circular(160)),
              child: Image.asset(ImagesAsset.DeliveryImage),
            ))
      ],
    );
  }
}
