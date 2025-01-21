import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/productdetails_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 5),
            height: 60,
            width: 80,
            decoration: BoxDecoration(
                color: controller.subitems[index]["active"] == "1"
                    ? ColorApp.primaryColor
                    : Colors.white,
                border: Border.all(color: ColorApp.primaryColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              controller.subitems[index]["name"],
              style: TextStyle(
                  color: controller.subitems[index]["active"] == "1"
                      ? Colors.white
                      : ColorApp.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
