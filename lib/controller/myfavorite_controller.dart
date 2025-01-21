import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:full_ecommerce/data/model/favoritemodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyfavoriteData myfavoriteData = MyfavoriteData(Get.find());

  List<FavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData
        .getData(myServices.sharedPrefrences.getString("id")!);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];

        data.addAll(responsedata.map((e) => FavoriteModel.fromJson(e)));

        print('data');

        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String favoriteid) async {
    var response = await myfavoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoritesId == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
