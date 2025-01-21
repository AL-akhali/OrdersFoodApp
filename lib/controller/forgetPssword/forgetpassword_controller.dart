import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;

  @override
  checkEmail() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(
        AppRoute.verfiyCode,
      );
    }

    @override
    void onInit() {
      email = TextEditingController();

      super.onInit();
    }

    @override
    void dispose() {
      email.dispose();

      super.dispose();
    }
  }

  @override
  goToVerfiyCode() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verfiyCode);
    } else {
      print("NOT VALID");
    }
  }
}
