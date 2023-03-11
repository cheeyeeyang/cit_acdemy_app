import 'dart:convert';
import 'package:cit_academy_app/statemanagement/app_verification.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Repository {
  //List api
  // String url = 'https://50d5-183-182-110-130.ap.ngrok.io/';
  String url = 'http://127.0.0.1:8000/';
  String register = 'api/register';
  String login = 'api/login';
  String logout = 'api/logout';
  String province = 'api/province';
  String district = 'api/district/';
  String village = 'api/village/';
  String role = 'api/role';
  String user = 'api/user';
  String position = 'api/position';
  String getposition = 'api/getposition';
  String getstudentRegister = 'api/getcountregister';
  String getstudent = 'api/getstudent';
  String getcountuser = 'api/getcountuser';
  String payment = 'api/payment';
  AppVerification appVerification = Get.put(AppVerification());
  Future<http.Response> get(
      {required String url, Map<String, String>? header, bool? auth}) async {
    try {
      var res = await http
          .get(Uri.parse(url),
              headers: header ??
                  {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    if (auth ?? false)
                      'Authorization': 'Bearer ${appVerification.token}'
                  })
          .timeout(const Duration(seconds: 15), onTimeout: () {
        return http.Response("Error", 408);
      });
      if (res.statusCode == 401) {
        // appVerification.storage.erase();
        return res;
      }
      return res;
    } catch (e) {
      // please comment print line before release
      // print(e);
      return http.Response("error", 503);
    }
  }

  Future<http.Response> post(
      {required String url,
      Map<String, String>? header,
      Map<String, String>? body,
      bool? auth}) async {
    try {
      var res = await http
          .post(Uri.parse(url),
              body: jsonEncode(body),
              headers: header ??
                  {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    if (auth ?? false)
                      'Authorization': 'Bearer ${appVerification.token}'
                  })
          .timeout(const Duration(seconds: 15), onTimeout: () {
        return http.Response("Error", 408);
      });
      if (res.statusCode == 401) {
        // appVerification.storage.erase();
        return res;
      }
      return res;
    } catch (e) {
      // please comment print line before release
      // print(e);
      return http.Response("error", 503);
    }
  }

  Future<http.Response> put(
      {required String url, Map<String, String>? header, bool? auth}) async {
    try {
      var res = await http
          .put(Uri.parse(url),
              headers: header ??
                  {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    if (auth ?? false)
                      'Authorization': 'Bearer ${appVerification.token}'
                  })
          .timeout(const Duration(seconds: 15), onTimeout: () {
        return http.Response("Error", 408);
      });
      if (res.statusCode == 401) {
        return res;
      }
      return res;
    } catch (e) {
      // please comment print line before release
      // print(e);
      return http.Response("error", 503);
    }
  }
}
