import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class SupriseData {
  Crud crud;

  SupriseData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.supriseLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
