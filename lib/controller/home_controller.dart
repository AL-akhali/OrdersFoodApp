import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/function/translateDatabase.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/home_data.dart';
import 'package:full_ecommerce/data/datasource/remote/search_data.dart';
import 'package:full_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  getToItems(
    List categories,
    int selectedCate,
    String categoriesID,
  );
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? lang;

  String? titleHomeCard;
  String? bodyHomeCard;

  HomeData homeData = HomeData(Get.find());
  SearchData searchData = SearchData(Get.find());

  List categories = [];
  List items = [];
  List surpriseData = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPrefrences.getString("username");
    lang = myServices.sharedPrefrences.getString("lang");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        surpriseData.addAll(response['surprise']['data']);
        titleHomeCard = translateDatabase(surpriseData[0]['surprise_title_ar'],
            surpriseData[0]['surprise_title']);
        bodyHomeCard = translateDatabase(surpriseData[0]['surprise_body_ar'],
            surpriseData[0]['surprise_body']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getToItems(categories, selectedCate, categoriesID) {
    Get.toNamed(AppRoute.itemsScreen, arguments: {
      "categories": categories,
      "selectedcate": selectedCate,
      "categoriesid": categoriesID
    });
  }

  goToProductDetails(itemsModel) {
    Get.toNamed("productsdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  bool isSearch = false;
  TextEditingController? search;
  late StatusRequest statusRequest;
  SearchData searchData = SearchData(Get.find());
  List<ItemsModel> listdata = [];
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;

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
}
