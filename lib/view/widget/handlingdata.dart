import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';
import 'package:lottie/lottie.dart';

class HandlingData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingData(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImagesAsset.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Lottie.asset(ImagesAsset.offline, width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(ImagesAsset.server,
                        width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(ImagesAsset.noData,
                            width: 250, height: 250),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImagesAsset.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Lottie.asset(ImagesAsset.offline, width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(ImagesAsset.server,
                        width: 250, height: 250),
                  )
                : widget;
  }
}
