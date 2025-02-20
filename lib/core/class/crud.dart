import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:full_ecommerce/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    var response = await http.post(Uri.parse(linkurl), body: data);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Response Body: ${response.body}");
      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
