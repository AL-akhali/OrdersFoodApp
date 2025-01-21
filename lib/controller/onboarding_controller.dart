import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/static/static.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late PageController pageController;

  int currentPage = 0;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPrefrences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
