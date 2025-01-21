import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String id, String usersid) async {
    var response = await crud.postData(AppLink.itemsLink,
        {"id": id.toString(), "usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
