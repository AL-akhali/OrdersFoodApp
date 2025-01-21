import 'package:flutter/material.dart';
import 'package:full_ecommerce/view/screen/home.dart';
import 'package:full_ecommerce/view/screen/myfavorite.dart';
import 'package:full_ecommerce/view/screen/offers.dart';
import 'package:full_ecommerce/view/screen/settings.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> ListPage = [
    Home(),
    MyfavoriteScreen(),
    OffersScreen(),
    SettingsScreen()
  ];

  List titlebottomappbar = [
    {"title": "61".tr, "icon": Icons.home},
    {"title": "64".tr, "icon": Icons.favorite},
    {"title": "60".tr, "icon": Icons.local_offer},
    {"title": "62".tr, "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
