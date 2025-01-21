import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/color.dart';

class CustomButtonAppbar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final bool active;

  const CustomButtonAppbar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
          padding: EdgeInsets.only(bottom: 4),
          onPressed: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: active == true ? ColorApp.primaryColor : ColorApp.grey2,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: active == true
                        ? ColorApp.primaryColor
                        : Colors.grey[800],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
