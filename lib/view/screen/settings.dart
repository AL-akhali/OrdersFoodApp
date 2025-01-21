import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/settings_controller.dart';
import 'package:full_ecommerce/core/constant/color.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                color: ColorApp.primaryColor,
              ),
              Positioned(
                  top: Get.width / 2.7,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(ImagesAsset.avatar),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 75,
          ),
          Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text("70".tr),
                    trailing: Icon(Icons.help_outline),
                  ),
                  Divider(),
                  ListTile(
                      onTap: () {},
                      title: Text("73".tr),
                      trailing: Switch(value: true, onChanged: (val) {})),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.languageScreen);
                    },
                    title: Text("1".tr),
                    trailing: Icon(Icons.language),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersPending);
                    },
                    title: Text("109".tr),
                    trailing: Icon(Icons.food_bank),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersArchive);
                    },
                    title: Text("110".tr),
                    trailing: Icon(Icons.archive_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressView);
                    },
                    title: Text("74".tr),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      launchUrl(Uri.parse("tel:+967771178499"));
                    },
                    title: Text("71".tr),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text("72".tr),
                    trailing: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
