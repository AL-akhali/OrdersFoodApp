import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';

class CardPaymentMethod extends StatelessWidget {
  final String text;
  final bool isActive;
  const CardPaymentMethod(
      {super.key, required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isActive == true ? ColorApp.secoundColor : ColorApp.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isActive == true ? Colors.white : ColorApp.secoundColor,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
