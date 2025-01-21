import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_ecommerce/controller/home_controller.dart';
import 'package:full_ecommerce/controller/items_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/data/model/categoriesmodel.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.getToItems(controller.categories, i!);
        controller.changeCate(i!, categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: EdgeInsets.all(5),
              decoration: controller.selectedCate == i
                  ? BoxDecoration(
                      border:
                          Border.all(width: 1, color: ColorApp.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : null,
              child: Text(
                "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: TextStyle(fontSize: 20, color: ColorApp.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
