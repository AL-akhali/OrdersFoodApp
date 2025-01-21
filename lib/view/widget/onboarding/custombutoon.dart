import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/onboarding_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomButoonOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomButoonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        child: Text("9".tr),
      ),
      color: ColorApp.primaryColor,
    );
  }
}
