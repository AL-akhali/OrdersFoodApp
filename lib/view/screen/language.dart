import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/localization/changelocal.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/view/widget/language/custombuttonlang.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonLang(
              textbuttton: "2".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CustomButtonLang(
              textbuttton: "3".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
