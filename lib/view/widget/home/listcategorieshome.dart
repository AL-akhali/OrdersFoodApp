import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_ecommerce/controller/home_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/data/model/categoriesmodel.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getToItems(controller.categories, i!,
            categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorApp.thirdColor,
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
                "${AppLink.categoriesImageLink}/${categoriesModel.categoriesImage}"),
          ),
          Text(
              "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}")
        ],
      ),
    );
  }
}
