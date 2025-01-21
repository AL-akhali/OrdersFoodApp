import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.notificationLink, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
