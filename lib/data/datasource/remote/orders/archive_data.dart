import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class ArchiveData {
  Crud crud;

  ArchiveData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.archiveOrder, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  ratingData(String ordersid, String comment, String rating) async {
    var response = await crud.postData(AppLink.ratingLink,
        {"id": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
