import 'package:dio/dio.dart';

mixin HttpResponseValidator {
  validateResponse(Response response) {
    if (response.statusCode == 200) {
      print("isOK");
    } else {
      print(response.statusMessage);
    }
  }
}
