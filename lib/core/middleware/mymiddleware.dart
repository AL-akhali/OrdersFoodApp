import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get Priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPrefrences.getString("step") == "2") {
      return RouteSettings(name: AppRoute.home);
    }
    if (myServices.sharedPrefrences.getString("step") == "1") {
      return RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
