import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/cart_controller.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  //productsDetails
  CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  int countitems = 0;

  //productsDetails

  intialData() async {
    statusRequest = StatusRequest.loading;

    itemsModel = Get.arguments["itemsmodel"];
    countitems =
        await cartController.getCountItems(itemsModel.itemsId!.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {"name": "66".tr, "id": 1, "active": "0"},
    {"name": "67".tr, "id": 1, "active": "0"},
    {"name": "68".tr, "id": 1, "active": "1"},
  ];

  add() {
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
