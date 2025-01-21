import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:full_ecommerce/linkapi.dart';

class CustomItemsCartList extends StatelessWidget {
  final String title;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAddPressed;
  final void Function()? onRemovePressed;

  const CustomItemsCartList({
    super.key,
    required this.title,
    required this.price,
    required this.count,
    required this.imagename,
    this.onAddPressed,
    this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: SvgPicture.network(
                  "${AppLink.itemsImageLink}/$imagename",
                  height: 90,
                  fit: BoxFit.fill,
                )),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(title),
                subtitle: Text(
                  price,
                  style: TextStyle(
                      color: ColorApp.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                IconButton(
                  onPressed: onAddPressed,
                  icon: Icon(Icons.add),
                ),
                Container(
                  child: Text(count),
                ),
                IconButton(
                    onPressed: onRemovePressed,
                    icon: Icon(
                      Icons.remove,
                    )),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
