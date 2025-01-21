import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "44".tr, middleText: "45".tr, actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("46".tr)),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("47".tr)),
  ]);
  return Future.value(true);
}
