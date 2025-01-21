import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';

class CardAddressPlace extends StatelessWidget {
  final String text;
  final String body;

  final bool active;

  const CardAddressPlace(
      {super.key,
      required this.text,
      required this.body,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: active ? ColorApp.secoundColor : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(text,
            style: TextStyle(
                color: active ? Colors.white : null,
                fontWeight: FontWeight.bold)),
        subtitle: Text(body,
            style: TextStyle(
                color: active ? Colors.white : null,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
