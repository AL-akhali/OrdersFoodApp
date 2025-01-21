import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/orders/pending_data.dart';
import 'package:full_ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class PendingController extends GetxController {
  PendingData pendingData = PendingData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "89".tr;
    } else {
      return "93".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "86".tr;
    } else {
      return "87".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "117".tr;
    } else if (val == "1") {
      return "118".tr;
    } else if (val == "2") {
      return "119".tr;
    } else {
      return "110".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await pendingData.getData(myServices.sharedPrefrences.getString("id")!);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String ordersId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.deleteData(ordersId);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
