import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/onboarding_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/data/datasource/static/static.dart';
import 'package:full_ecommerce/view/widget/onboarding/custombutoon.dart';
import 'package:full_ecommerce/view/widget/onboarding/customslider.dart';
import 'package:full_ecommerce/view/widget/onboarding/dotscontroller.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                child: Column(
              children: [
                DotsControllerOnBoarding(),
                Spacer(
                  flex: 2,
                ),
                CustomButoonOnBoarding()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
