import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:get/get.dart';

abstract class ResertPasswordController extends GetxController {
  resetPassword();
  goToSuccess();
}

class ResertPasswordControllerImp extends ResertPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController rePassword;

  bool isShowPass = true;

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  goToSuccess() {
    Get.toNamed(AppRoute.successResetPassword);
  }

  @override
  resetPassword() {}

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
