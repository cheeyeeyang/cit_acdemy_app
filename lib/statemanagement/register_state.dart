// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cit_academy_app/models/register_success_model.dart';
import 'package:cit_academy_app/models/user_model.dart';
import 'package:cit_academy_app/pages/poster_page.dart';
import 'package:cit_academy_app/pages/register_success_page.dart';
import 'package:cit_academy_app/pages/user/user_home_page.dart';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:cit_academy_app/statemanagement/app_verification.dart';
import 'package:cit_academy_app/statemanagement/date_picker_state.dart';
import 'package:cit_academy_app/statemanagement/home_state.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterState extends GetxController {
  Repository repository = Repository();
  AppVerification appVerification = Get.put(AppVerification());
  HomeState homeState = Get.put(HomeState());
  DatePickerState datePickerState = Get.put(DatePickerState());
  RegisterSuccessModel? registerSuccessModel;
  UserModel? userModel;
  bool check = false;
  bool checkRegister = false;
  bool checkUser = false;
  String? message;
  postSignIn(
      {required BuildContext context,
      required String phone,
      required String password}) async {
    check = false;
    update();
    if (check == false && phone != "" && password != "") {
      DiaLogApp().circleprogressDialog(context);
    }
    try {
      var res = await http.post(
        Uri.parse(repository.url + repository.login),
        body: jsonEncode({
          'phone': phone,
          'password': password,
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (res.statusCode == 200) {
        await appVerification.setNewToken(text: jsonDecode(res.body)['token']);
        userModel = UserModel.fromJson(jsonDecode(res.body)['user']);
        check=true;
        update();
        print('login success');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const UserHomePage()));
      } else {
        check = false;
        update();
        Navigator.pop(context);
        DiaLogApp().loginfailedDialog(context);
        print('login Fail');
      }
    } catch (e) {
      print(e);
    }
  }

  postRegister(
      {required BuildContext context,
      required String firstname,
      required String lastname,
      required String size,
      required String number,
      required String proid,
      required String disid,
      required String villid,
      required String address,
      required String phone,
      required String note}) async {
    checkRegister = false;
    update();
    DiaLogApp().circleprogressDialog(context);
    try {
      var res = await http.post(
        Uri.parse(repository.url + repository.register),
        body: jsonEncode({
          'firstname': firstname,
          'lastname': lastname,
          'bod': datePickerState.dateFrom.toString(),
          'size': size,
          'number': number,
          'pro_id': proid,
          'dis_id': disid,
          'vill_id': villid,
          'address': address,
          'phone': phone,
          'note': note
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (res.statusCode == 200) {
        registerSuccessModel =
            RegisterSuccessModel.fromJson(jsonDecode(res.body)['data']);
        Navigator.pop(context);
        setcheckSuccess(true);
        checkRegister = true;
        update();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RegisterSuccessPage()));
        print('register success');
      } else {
        Navigator.pop(context);
        DiaLogApp().warningDialog(context);
        checkRegister = false;
        update();
        print('register Fail');
      }
      print(jsonDecode(res.body));
    } catch (e) {
      print(e);
    }
    update();
  }

  setcheckSuccess(bool check) {
    checkRegister = check;
    update();
  }

  logout({required BuildContext context}) async {
    try {
      var res = await repository.post(
          url: repository.url + repository.logout,
          auth: true);
      if (res.statusCode == 200) {
        appVerification.removeToken();
        update();
        print('logout success');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PosterPage()));
      } else {
        print('logout Fail');
      }
    } catch (e) {
      print(e);
    }
  }
}
