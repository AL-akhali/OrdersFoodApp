import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class SearchData {
  Crud crud;

  SearchData(this.crud);

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchLink, {'search': search});
    return response.fold((l) => l, (r) => r);
  }
}
