import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';

class CustomTxtFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTxtFormField(
      {super.key,
      this.obscureText,
      this.onTapIcon,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      this.myController,
      required this.valid,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: ColorApp.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: 9),
                child: Text(labelText)),
            suffixIcon: InkWell(
              child: Icon(iconData),
              onTap: onTapIcon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
