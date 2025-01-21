import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class OffersData {
  Crud crud;

  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offersLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
