import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/home_controller.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/items_data.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixController {
  intialData();
  changeCate(int val, String cateVal);
  getItems(
    String categoriesid,
  );
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCate;
  String? cateId;

  ItemsData itemsData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  TextEditingController? search;

  List<ItemsModel> listdata = [];

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCate = Get.arguments['selectedcate'];
    cateId = Get.arguments['categoriesid'];

    getItems(cateId!);
  }

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  changeCate(val, cateVal) {
    selectedCate = val;
    cateId = cateVal;
    getItems(cateId!);
    update();
  }

  @override
  getItems(categoriesid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoriesid, myServices.sharedPrefrences.getString("id")!);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed("productsdetails", arguments: {"itemsmodel": itemsModel});
  }
}
