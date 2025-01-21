import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:full_ecommerce/data/datasource/remote/test_data.dart';

import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  // String? validateEmail(String? email) {
  //   RegExp emailRegex = RegExp(r'^[\W\.-]+@[\W-]+\.\W{2,3}(\.\w{2,3})?$');
  //   final isEmailVaild = emailRegex.hasMatch(email ?? '');
  //   if(isEmailVaild){
  //     return "please enter valid email";
  //   }
  //   return null;
  // }

  bool isShowPass = true;

  SignUpData signUpData = SignUpData(Get.find());

  List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postdata(
          username.text, password.text, email.text, phone.text);
      print("======================Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successSignUp,
              // arguments: {"email": email.text}
              );
        } else {
          Get.defaultDialog(title: "48".tr, middleText: "49".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
