import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/search_data.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  SearchData searchData = SearchData(Get.find());

  TextEditingController? search;

  List<ItemsModel> listdata = [];

  bool isSearch = false;

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchItemsData();
    update();
  }

  searchItemsData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.searchData(search!.text);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responseData = response['data'];
        listdata.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();

    super.onInit();
  }
}
