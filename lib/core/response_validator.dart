import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:test_t4f/core/utils/my_tools.dart';

mixin HttpResponseValidator {
  get context => null;

  validateResponse(Response response) {
    if (response.statusCode == 200) {
      print("isOK");
    } else {
      MyTools.showAlert(
          context: context, title: 'error', btnOkOnPress: () {}, btnCancelOnPress: () {}, desc: 'failed to load information about products');
    }
  }
}
