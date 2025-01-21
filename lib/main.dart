import 'package:flutter/material.dart';
import 'package:full_ecommerce/bindnig.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/localization/changelocal.dart';
import 'package:full_ecommerce/core/localization/translation.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/route.dart';
import 'package:full_ecommerce/view/screen/homescreen.dart';
import 'package:full_ecommerce/view/screen/language.dart';
import 'package:full_ecommerce/view/screen/onboarding.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
