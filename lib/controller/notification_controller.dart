import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/notificationdata.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationdata = NotificationData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationdata
        .getData(myServices.sharedPrefrences.getString("id")!);
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
