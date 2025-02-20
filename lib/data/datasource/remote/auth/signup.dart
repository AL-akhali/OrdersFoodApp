import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postdata(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signUpLink, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
