import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/productdetails_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class PriceAndCount extends GetView<ProductDetailsControllerImp> {
  final void Function()? onPressedIconAdd;
  final void Function()? onPressedIconRemove;
  final String count;
  final String price;
  const PriceAndCount(
      {required this.onPressedIconAdd,
      required this.onPressedIconRemove,
      required this.count,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onPressedIconAdd, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 2),
              width: 50,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                count,
                style: TextStyle(fontSize: 20, height: 1.1),
              ),
            ),
            IconButton(
                onPressed: onPressedIconRemove, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
              color: ColorApp.primaryColor, fontSize: 20, height: 1.1),
        )
      ],
    );
  }
}
