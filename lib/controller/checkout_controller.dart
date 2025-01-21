import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/address_data.dart';
import 'package:full_ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:full_ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  AddressData addressData = Get.put(AddressData(Get.find()));
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<AddressModel> dataaddress = [];
  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  late String priceorder;
  late String couponid;
  late String discountcoupon;

  choosePaymentsMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response =
        await addressData.getData(myServices.sharedPrefrences.getString('id')!);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        dataaddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) return Get.snackbar("94".tr, "106".tr);
    if (deliveryType == null) return Get.snackbar("94".tr, "107".tr);
    if (dataaddress.isEmpty) return Get.snackbar("94".tr, "132".tr);

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPrefrences.getString("id"),
      "addressid": addressid,
      "orderstype": deliveryType,
      "pricedelivery": "10",
      "ordersprice": priceorder,
      "couponid": couponid,
      "discountcoupon": discountcoupon,
      "paymentmethod": paymentMethod,
    };
    var response = await checkoutData.checkoutOrder(data);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("43".tr, "105".tr);
        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("94".tr, "56".tr);
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'].toString();
    priceorder = Get.arguments['priceorder'].toString();
    discountcoupon = Get.arguments['discountcoupon'].toString();

    getShippingAddress();

    super.onInit();
  }
}
