import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/onboarding_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/data/datasource/static/static.dart';
import 'package:get/get.dart';

class DotsControllerOnBoarding extends StatelessWidget {
  const DotsControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.only(right: 5),
                          duration: Duration(microseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: ColorApp.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
