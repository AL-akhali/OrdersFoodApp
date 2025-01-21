import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  checkoutOrder(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
