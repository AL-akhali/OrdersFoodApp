import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_ecommerce/controller/productdetails_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class StackProduct extends GetView<ProductDetailsControllerImp> {
  const StackProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
              color: ColorApp.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        Positioned(
          top: 30.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: SvgPicture.network(
              "${AppLink.itemsImageLink}/${controller.itemsModel.itemsImage}",
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
