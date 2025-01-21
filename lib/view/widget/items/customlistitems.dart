import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_ecommerce/controller/favorite_controller.dart';
import 'package:full_ecommerce/controller/items_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({
    super.key,
    required this.itemsModel,
    // required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: SvgPicture.network(
                      "${AppLink.itemsImageLink}/${itemsModel.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${translateDatabase(itemsModel.itemsDescAr, itemsModel.itemsDesc)}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "127".tr,
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
                      Text("${itemsModel.itemsPriceDiscount}\$",
                          style: TextStyle(
                              color: ColorApp.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModel.itemsId, "0");
                                controller.removeFavorite(
                                    itemsModel.itemsId!.toString());
                              } else {
                                controller.setFavorite(itemsModel.itemsId, "1");
                                controller.addFavorite(
                                    itemsModel.itemsId!.toString());
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red,
                    ),
                    child: Text(
                      "${itemsModel.itemsDiscount} \%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                  //  Image.asset(
                  //   ImagesAsset.onBoardingImageOne,
                  //   width: 40,
                  // ),
                  ),
          ],
        ),
      ),
    );
  }
}
