import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_ecommerce/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbuttton;
  final void Function()? onPressed;
  const CustomButtonLang(
      {super.key, required this.textbuttton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: ColorApp.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbuttton,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
