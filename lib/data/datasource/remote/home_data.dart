import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homeLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
