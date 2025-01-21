import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:full_ecommerce/core/function/handlingdata.dart';
import 'package:full_ecommerce/core/services/services.dart';
import 'package:full_ecommerce/data/datasource/remote/orders/detailsdata.dart';
import 'package:full_ecommerce/data/model/cartmodel.dart';
import 'package:full_ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  late OrdersModel ordersModel;

  DetailsData detailsData = DetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await detailsData.getData(ordersModel.ordersId!.toString());
    print("======================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getData();
    super.onInit();
  }
}
