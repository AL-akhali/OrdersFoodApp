import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_ecommerce/controller/home_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:full_ecommerce/linkapi.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:full_ecommerce/view/widget/customappbar.dart';
import 'package:full_ecommerce/view/widget/home/customcardhome.dart';
import 'package:full_ecommerce/view/widget/home/customtitlehome.dart';
import 'package:full_ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:full_ecommerce/view/widget/home/listitemshome.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            // البحث و الايقونات
            CustomAppBar(
              controller: controller.search!,
              titleAppbar: "57".tr,
              onPressedIcon: () {
                Get.toNamed(AppRoute.notificationScreen);
              },
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
            HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // العروض
                          CustomCardHome(
                            title: "${controller.titleHomeCard}",
                            body: "${controller.bodyHomeCard}",
                          ),
                          //الاصناف
                          CustomTitleHome(title: "59".tr),
                          ListCategoriesHome(),
                          // وجبات لك
                          CustomTitleHome(title: "58".tr),
                          ListItemsHome(),
                        ],
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata))
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProductDetails(listdatamodel[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: SvgPicture.network(
                      "${AppLink.itemsImageLink}/${listdatamodel[index].itemsImage}",
                    )),
                    Expanded(
                        child: ListTile(
                      title: Text(translateDatabase(
                          listdatamodel[index].itemsNameAr,
                          listdatamodel[index].itemsName)),
                      subtitle: Text(translateDatabase(
                          listdatamodel[index].categoriesNameAr,
                          listdatamodel[index].categoriesName)),
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
