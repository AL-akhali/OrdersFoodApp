import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_ecommerce/controller/favorite_controller.dart';
import 'package:full_ecommerce/controller/items_controller.dart';
import 'package:full_ecommerce/controller/myfavorite_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/data/model/favoritemodel.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final FavoriteModel favoriteModel;
  // final bool active;
  const CustomListFavoriteItems({
    super.key,
    required this.favoriteModel,
    // required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${favoriteModel.itemsId}",
                child: SvgPicture.network(
                  "${AppLink.itemsImageLink}/${favoriteModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "${translateDatabase(favoriteModel.itemsNameAr, favoriteModel.itemsName)}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${translateDatabase(favoriteModel.itemsDescAr, favoriteModel.itemsDesc)}",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "تقيم 3.5",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${favoriteModel.itemsPrice}\$",
                      style: TextStyle(
                          color: ColorApp.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {
                        controller
                            .deleteData(favoriteModel.favoritesId!.toString());
                      },
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
