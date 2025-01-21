import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title.tr,
        style: TextStyle(
            fontSize: 20,
            color: ColorApp.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
