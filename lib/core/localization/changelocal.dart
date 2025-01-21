import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/theme.dart';
import 'package:full_ecommerce/core/function/fcmconfig.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPrefrences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);

    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? sharedPrefLang = myServices.sharedPrefrences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
