import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not vaild username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isUsername(val)) {
      return "not vaild email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isUsername(val)) {
      return "not vaild phone";
    }
  }
  if (val.isEmpty) {
    return "can't be Empty";
  }
  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be larger than $max";
  }
}
