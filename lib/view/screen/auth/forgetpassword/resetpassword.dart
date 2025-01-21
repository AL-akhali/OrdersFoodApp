import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/forgetPssword/forgetpassword_controller.dart';
import 'package:full_ecommerce/controller/forgetPssword/resetpassword_controller.dart';
import 'package:full_ecommerce/controller/auth/signup_controller.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
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

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResertPasswordControllerImp controller =
        Get.put(ResertPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("33".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: ColorApp.grey)),
        ),
        body: GetBuilder<ResertPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTxtBody(txtBody: "34".tr),
                          SizedBox(
                            height: 55,
                          ),
                          CustomTxtFormField(
                            obscureText: controller.isShowPass,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            hintText: "36".tr,
                            labelText: "37".tr,
                            iconData: Icons.password_outlined,
                            myController: controller.password,
                            valid: (val) {
                              return validinput(val!, 5, 30, "password");
                            },
                            isNumber: false,
                          ),
                          CustomTxtFormField(
                            obscureText: controller.isShowPass,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            hintText: "38".tr,
                            labelText: "39".tr,
                            iconData: Icons.password_outlined,
                            myController: controller.rePassword,
                            valid: (val) {
                              return validinput(val!, 5, 30, "password");
                            },
                            isNumber: false,
                          ),
                          CustomButton(
                            text: "35".tr,
                            onPressed: () {
                              controller.goToSuccess();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
