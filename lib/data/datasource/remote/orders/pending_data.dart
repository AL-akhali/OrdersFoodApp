import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class PendingData {
  Crud crud;

  PendingData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.pendingOrder, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordersid) async {
    var response =
        await crud.postData(AppLink.orderDeleye, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
