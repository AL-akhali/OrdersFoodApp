import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/address_data.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? detailes;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    detailes = TextEditingController();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
      myServices.sharedPrefrences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      detailes!.text,
    );
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        Get.snackbar("133".tr, "134".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
