import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/address_data.dart';
import 'package:full_ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  MyServices myServices = Get.find();

  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getData(
      myServices.sharedPrefrences.getString("id")!,
    );
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }
}
