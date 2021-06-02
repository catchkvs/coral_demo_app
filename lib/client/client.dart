
import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:coral_demo_app/config/constants.dart';
import 'package:coral_demo_app/model/store_setting.dart';
import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DeviceAuthClient {

  static HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  static Future<String> login(String pharmacyCode, String pin) async {

    String url = BASE_URL + "/pharmacy/device/auth";
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'pharmacy-code': pharmacyCode,
      'pharmacy-pin': pin
    };
    var response = await httpClient.post(url, headers: requestHeaders);

    StoreSettings settings = StoreSettings.fromJson(jsonDecode(response.body));
    print(settings);
    _saveApiToken(settings.ApiToken);
    print(response.body.toString());
    if(response.statusCode == 200) {
      return "SUCCESS";
    } else {
      return "FAILURE";
    }
  }

  static _saveApiToken(String apiToken)  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiToken', apiToken);
  }
}