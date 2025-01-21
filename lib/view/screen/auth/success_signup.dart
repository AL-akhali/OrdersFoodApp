import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/auth/signup_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/view/widget/auth/custombutton.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "40".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: ColorApp.primaryColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("43".tr),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButton(
                text: "41".tr,
                onPressed: () {
                  controller.goToSignIn();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
