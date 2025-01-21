import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postdata(
    String email,
    String password,
  ) async {
    var response = await crud.postData(AppLink.loginLink, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
