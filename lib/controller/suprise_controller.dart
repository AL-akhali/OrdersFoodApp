import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/data/datasource/remote/suprise_data.dart';
import 'package:full_ecommerce/data/datasource/remote/test_data.dart';
import 'package:full_ecommerce/data/model/suprisemodel.dart';
import 'package:get/get.dart';

class SupriseController extends GetxController {
  SupriseData supriseData = SupriseData(Get.find());
  late final SupriseModel supriseModel;

  List data = [];

  late StatusRequest statusRequest;

  getSupData() async {
    statusRequest = StatusRequest.loading;
    var response = await supriseData.getData();
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
    getSupData();
    super.onInit();
  }
}
