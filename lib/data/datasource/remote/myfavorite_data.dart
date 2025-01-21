import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class MyfavoriteData {
  Crud crud;

  MyfavoriteData(this.crud);

  getData(String id) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response =
        await crud.postData(AppLink.deleteFromFavorite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
