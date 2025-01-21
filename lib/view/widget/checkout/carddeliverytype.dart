import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:get/get.dart';

class CardDeliveryType extends StatelessWidget {
  final String text;
  final String imagename;
  final bool active;
  const CardDeliveryType(
      {super.key,
      required this.text,
      required this.imagename,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: active ? ColorApp.secoundColor : null,
          border: Border.all(color: ColorApp.secoundColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: 60,
          ),
          Text(
            text,
            style: TextStyle(
                color: active ? Colors.white : ColorApp.secoundColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
