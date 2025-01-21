import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/favorite_controller.dart';
import 'package:full_ecommerce/controller/items_controller.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:full_ecommerce/view/screen/home.dart';
import 'package:full_ecommerce/view/widget/customappbar.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:full_ecommerce/view/widget/items/customlistitems.dart';
import 'package:full_ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              controller: controller.search!,
              titleAppbar: "57".tr,
              onPressedIcon: () {},
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onPressedIconFav: () {
                Get.toNamed(AppRoute.myFavorite);
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingData(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.6),
                            itemBuilder: (BuildContext context, index) {
                              controllerFav.isFavorite[controller.data[index]
                                      ["items_id"]] =
                                  controller.data[index]["favorites"];
                              return CustomListItems(
                                  itemsModel: ItemsModel.fromJson(
                                      controller.data[index]));
                            })
                        : ListItemsSearch(listdatamodel: controller.listdata))),
          ],
        ),
      ),
    );
  }
}
