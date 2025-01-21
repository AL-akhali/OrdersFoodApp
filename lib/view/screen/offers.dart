import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/favorite_controller.dart';
import 'package:full_ecommerce/controller/offers_controller.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:full_ecommerce/view/screen/home.dart';
import 'package:full_ecommerce/view/widget/customappbar.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:full_ecommerce/view/widget/offers/customlistitemsoffer.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController favoriteController = Get.put(FavoriteController());

    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            CustomAppBar(
              controller: controller.search!,
              titleAppbar: "57".tr,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onPressedSearch: () {
                controller.onSearchItems();
              },
            ),
            SizedBox(
              height: 20,
            ),
            !controller.isSearch
                ? HandlingData(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => CustomListItemsOffer(
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]))))
                : ListItemsSearch(listdatamodel: controller.listdata)
          ],
        ),
      ),
    );
  }
}
