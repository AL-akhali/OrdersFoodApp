import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/auth/signup_controller.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:full_ecommerce/core/function/alertexeitapp.dart';
import 'package:full_ecommerce/core/function/validinput.dart';
import 'package:full_ecommerce/view/widget/auth/custombutton.dart';
import 'package:full_ecommerce/view/widget/auth/customtxtbody.dart';
import 'package:full_ecommerce/view/widget/auth/customtxtformfield.dart';
import 'package:full_ecommerce/view/widget/auth/customtxttitle.dart';
import 'package:full_ecommerce/view/widget/auth/logoauth.dart';
import 'package:full_ecommerce/view/widget/auth/txtsignup.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("19".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: ColorApp.grey)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTxtTitle(txtTile: "11".tr),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTxtBody(txtBody: "24".tr),
                          SizedBox(
                            height: 55,
                          ),
                          CustomTxtFormField(
                            hintText: "23".tr,
                            labelText: "22".tr,
                            iconData: Icons.person_2_outlined,
                            myController: controller.username,
                            valid: (val) {
                              return validinput(val!, 5, 30, "username");
                            },
                            isNumber: false,
                          ),
                          CustomTxtFormField(
                            hintText: "14".tr,
                            labelText: "13".tr,
                            iconData: Icons.email_outlined,
                            myController: controller.email,
                            valid: (val) {},
                            isNumber: false,
                          ),
                          GetBuilder<SignUpControllerImp>(
                            builder: (controller) => CustomTxtFormField(
                              obscureText: controller.isShowPass,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              hintText: "15".tr,
                              labelText: "16".tr,
                              iconData: Icons.password_outlined,
                              myController: controller.password,
                              valid: (val) {
                                return validinput(val!, 5, 30, "password");
                              },
                              isNumber: false,
                            ),
                          ),
                          CustomTxtFormField(
                            hintText: "21".tr,
                            labelText: "20".tr,
                            iconData: Icons.phone,
                            myController: controller.phone,
                            valid: (val) {
                              return validinput(val!, 5, 30, "phone");
                            },
                            isNumber: false,
                          ),
                          CustomButton(
                            text: "19".tr,
                            onPressed: () {
                              controller.signUp();
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TxtSignUp(
                            txt: "25".tr,
                            txtsign: "10".tr,
                            onTap: () {
                              controller.goToSignIn();
                            },
                          )
                        ],
                      ),
                    ),
                  )),
            )));
  }
}
