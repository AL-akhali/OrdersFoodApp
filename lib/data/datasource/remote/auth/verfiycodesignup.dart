import 'package:full_ecommerce/core/class/crud.dart';
import 'package:full_ecommerce/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;

  VerfiyCodeSignUpData(this.crud);

  postdata(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verfiyCodeSignUpLink, {
      "email": email,
      "verfiycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
