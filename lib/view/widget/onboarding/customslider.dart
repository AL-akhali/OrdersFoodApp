import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/onboarding_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/data/datasource/static/static.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onBoardingList[i].title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 2, color: ColorApp.grey),
                    )),
              ],
            ));
  }
}
