import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/forgetPssword/forgetpassword_controller.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("26".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: ColorApp.grey)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTxtTitle(txtTile: "27".tr),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTxtFormField(
                            hintText: "14".tr,
                            labelText: "13".tr,
                            iconData: Icons.email_outlined,
                            myController: controller.email,
                            valid: (val) {
                              return validinput(val!, 5, 100, "email");
                            },
                            isNumber: false,
                          ),
                          CustomButton(
                            text: "28".tr,
                            onPressed: () {
                              controller.goToVerfiyCode();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
