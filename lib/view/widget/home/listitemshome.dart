import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_ecommerce/controller/home_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class Items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;

  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.network(
              "${AppLink.itemsImageLink}/${itemsModel.itemsImage}",
              width: 150,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 200,
          ),
          Positioned(
              right: controller.lang == "ar" ? 20 : null,
              left: controller.lang == "en" ? 15 : null,
              top: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: ColorApp.secoundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ))
        ],
      ),
    );
  }
}
