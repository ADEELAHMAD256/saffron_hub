// ignore_for_file: unnecessary_null_comparison, avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';


import '../utils/functions.dart';

class ApiChecker {
  Future<Response> checkApi({required http.Response respons, bool showUserError = true, bool showSystemError = true}) async {
    dynamic  response =Response(
          body: jsonDecode(respons.body) ?? respons.body,
          bodyString: respons.body.toString(),
          request: Request(
              headers: respons.request!.headers,
              method: respons.request!.method,
              url: respons.request!.url),
          headers: respons.headers,
          statusCode: respons.statusCode,
          statusText: respons.reasonPhrase,
        );
    print(response.body);
    print("status code: ${response.statusCode}");
    if (response == null) {
      if (showSystemError) {
        errorAlert('Check your internet connection and try again');
      }
    } else if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode! == 401 || response.statusCode! == 403) {
      if (showUserError) {
        // await AuthController().logout();
        // Get.offAll(() =>  PhoneVerification());
        // errorAlert(response.body['message']);
      }
    } else if (response.statusCode! >= 500) {
      if (showSystemError) {
        errorAlert(
          'Server Error!\nPlease try again...',
        );
      }
    } else if (response.statusCode! >= 400) {
      if (showUserError) {
        errorAlert(response.body.toString());
      }
    }
    return Response(statusCode: response.statusCode, statusText: response.body);
  }
}
