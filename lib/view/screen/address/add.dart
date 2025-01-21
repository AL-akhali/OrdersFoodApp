import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/address/add_address_controller.dart';
import 'package:full_ecommerce/view/widget/auth/custombutton.dart';
import 'package:full_ecommerce/view/widget/auth/customtxtformfield.dart';
import 'package:full_ecommerce/view/widget/handlingdata.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerPage = Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("80".tr)),
        ),
        body: GetBuilder<AddAddressController>(
            builder: (controllerPage) => HandlingData(
                  statusRequest: controllerPage.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(15),
                    child: ListView(
                      children: [
                        CustomTxtFormField(
                            hintText: "97".tr,
                            labelText: "96".tr,
                            iconData: Icons.location_city,
                            valid: (val) {},
                            myController: controllerPage.city,
                            isNumber: false),
                        CustomTxtFormField(
                            hintText: "99".tr,
                            labelText: "98".tr,
                            iconData: Icons.streetview,
                            valid: (val) {},
                            myController: controllerPage.street,
                            isNumber: false),
                        CustomTxtFormField(
                            hintText: "101".tr,
                            labelText: "100".tr,
                            iconData: Icons.near_me,
                            valid: (val) {},
                            myController: controllerPage.name,
                            isNumber: false),
                        CustomTxtFormField(
                            hintText: "104".tr,
                            labelText: "103".tr,
                            iconData: Icons.details,
                            valid: (val) {},
                            myController: controllerPage.detailes,
                            isNumber: false),
                        CustomButton(
                          text: "102".tr,
                          onPressed: () {
                            controllerPage.addAddress();
                          },
                        )
                      ],
                    ),
                  ),
                )));
  }
}
