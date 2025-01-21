import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class DetailsData {
  Crud crud;

  DetailsData(this.crud);

  getData(String ordersid) async {
    var response =
        await crud.postData(AppLink.detailsOrder, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
