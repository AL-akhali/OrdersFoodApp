import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/cart_data.dart';
import 'package:full_ecommerce/data/model/cartmodel.dart';
import 'package:full_ecommerce/data/model/couponmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  TextEditingController? controllerCoupon;

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  CouponModel? couponModel;

  MyServices myServices = Get.find();

  double priceorder = 0.0;
  int totalcountitems = 0;

  int? discountcoupon = 0;
  String? couponname;
  String? couponid;

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPrefrences.getString("id")!, itemsid);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPrefrences.getString("id")!, itemsid);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPrefrences.getString("id")!, itemsid);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;

        countitems = response['data'];
        print("==============================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorder = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response =
        await cartData.viewCart(myServices.sharedPrefrences.getString("id")!);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List responseData = response['datacart']['data'];
          Map responseDataCountPrice = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalcountitems =
              int.parse(responseDataCountPrice['totalcount'].toString());
          priceorder =
              double.parse(responseDataCountPrice['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> couponData = response['data'];
        couponModel = CouponModel.fromJson(couponData);
        discountcoupon = couponModel!.couponDiscount!;
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("94".tr, "108".tr);
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceorder - priceorder * discountcoupon! / 100);
  }

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("94".tr, "95".tr);
    Get.toNamed(AppRoute.checkoutScreen, arguments: {
      "couponid": couponid ?? 0,
      "priceorder": priceorder,
      "discountcoupon": discountcoupon
    });
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    super.onInit();
  }
}
