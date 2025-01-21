import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.addressViewLink, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(
    String usersid,
    String name,
    String city,
    String street,
    String details,
  ) async {
    var response = await crud.postData(AppLink.addressAddLink, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "details": details,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response = await crud
        .postData(AppLink.addressdeleteLink, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
