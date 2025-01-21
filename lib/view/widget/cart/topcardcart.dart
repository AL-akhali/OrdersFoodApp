import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String text;
  const TopCardCart({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: ColorApp.thirdColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
