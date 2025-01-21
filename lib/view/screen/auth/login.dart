import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/auth/login_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("10".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: ColorApp.grey)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              LogoAuth(),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTxtTitle(txtTile: "11".tr),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTxtBody(txtBody: "12".tr),
                              SizedBox(
                                height: 55,
                              ),
                              CustomTxtFormField(
                                hintText: "14".tr,
                                labelText: "13".tr,
                                iconData: Icons.email_outlined,
                                myController: controller.email,
                                valid: (val) {},
                                isNumber: false,
                              ),
                              CustomTxtFormField(
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
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "17".tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              CustomButton(
                                text: "10".tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TxtSignUp(
                                txt: "18".tr,
                                txtsign: "19".tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
