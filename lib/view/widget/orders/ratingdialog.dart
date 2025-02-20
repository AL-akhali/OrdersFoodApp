import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/orders/archive_controller.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: Text(
              '128'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: Text(
              '131'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              ImagesAsset.logo,
              width: 200,
              height: 200,
            ),
            submitButtonText: '130'.tr,
            commentHint: '129'.tr,
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              ArchiveController controller = Get.find();
              // print('rating: ${response.rating}, comment: ${response.comment}');
              controller.sumbitRating(
                  ordersid, response.rating, response.comment);
            },
          ));
}
