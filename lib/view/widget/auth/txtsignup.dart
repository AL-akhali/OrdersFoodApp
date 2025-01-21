import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

class TxtSignUp extends StatelessWidget {
  final String txt;
  final String txtsign;
  final void Function()? onTap;
  const TxtSignUp(
      {super.key, required this.txt, required this.txtsign, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(txt),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            txtsign,
            style: TextStyle(
                color: ColorApp.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
