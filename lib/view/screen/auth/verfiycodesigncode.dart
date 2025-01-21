import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:full_ecommerce/controller/forgetPssword/forgetpassword_controller.dart';
import 'package:full_ecommerce/controller/auth/signup_controller.dart';
import 'package:full_ecommerce/controller/forgetPssword/verifycode_controller.dart';
import 'package:full_ecommerce/controller/auth/verifycodesignup_controller.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:full_ecommerce/view/widget/auth/custombutton.dart';
import 'package:full_ecommerce/view/widget/auth/customtxtbody.dart';
import 'package:full_ecommerce/view/widget/auth/customtxtformfield.dart';
import 'package:full_ecommerce/view/widget/auth/customtxttitle.dart';
import 'package:full_ecommerce/view/widget/auth/logoauth.dart';
import 'package:full_ecommerce/view/widget/auth/txtsignup.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("29".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: ColorApp.grey)),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: ListView(
                      children: [
                        CustomTxtTitle(txtTile: "30".tr),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "50".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ColorApp.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OtpTextField(
                          keyboardType: TextInputType.number,
                          borderWidth: 5,
                          fieldWidth: 45.0,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: Color.fromARGB(255, 113, 69, 218),
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            controller.goToSucessSignUp(verificationCode);
                          },
                        ),
                        // CustomButton(
                        //   text: "28".tr,
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                )));
  }
}
