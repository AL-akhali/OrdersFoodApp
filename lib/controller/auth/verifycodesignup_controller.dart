import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/data/datasource/remote/auth/verfiycodesignup.dart';
import 'package:full_ecommerce/view/screen/auth/verfiycodesigncode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSucessSignUp(String verifyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSucessSignUp(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignUpData.postdata(email!, verifyCodeSignUp);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(
          AppRoute.successSignUp,
          // arguments: {
          //       "email" : email.text
          //     }
        );
      } else {
        Get.defaultDialog(title: "48".tr, middleText: "51".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  checkCode() {}

  @override
  void onInit() {
    // email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
