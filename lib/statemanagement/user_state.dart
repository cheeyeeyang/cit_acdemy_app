// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:cit_academy_app/models/get_user_model.dart';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:cit_academy_app/statemanagement/app_verification.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserState extends GetxController {
  AppVerification appVerification = Get.put(AppVerification());
  List<GetUserModel> userData = [];
  List<GetUserModel> searchuser = [];
  GetUserModel? editmodel;
  Repository repository = Repository();
  bool check = false;
  int countRegister = 0;
  int countUser = 0;
  bool checkRegister = false;
  bool checkcountUser = false;
  getcountUser() async {
    try {
      checkcountUser = false;
      update();
      var res = await repository.get(
          url: repository.url + repository.getcountuser, auth: true);
      if (res.statusCode == 200) {
        countUser = jsonDecode(res.body)['count'];
        checkcountUser = true;
        update();
      }
    } catch (ex) {
      print('count erorr ${ex}');
    }
  }

  getstudentRegister() async {
    try {
      checkRegister = false;
      update();
      var res = await repository.get(
          url: repository.url + repository.getstudentRegister, auth: true);
      if (res.statusCode == 200) {
        countRegister = jsonDecode(res.body)['count'];
        checkRegister = true;
        update();
      }
    } catch (ex) {
      print('count erorr ${ex}');
    }
  }

  getData() async {
    var res =
        await repository.get(url: repository.url + repository.user, auth: true);
    if (res.statusCode == 200) {
      userData = [];
      update();
      for (var item in jsonDecode(res.body)['data']) {
        userData.add(GetUserModel.fromJson(item));
      }
      searchuser = userData;
      check = true;
      update();
      print('get users success');
    } else {
      check = false;
      update();
      print('get user failded');
    }
  }

  searchData(String text) {
    searchuser = userData
        .where((e) => (e.firstname.toString().contains(text) ||
            e.lastname.toString().contains(text) ||
            e.phone.toString().contains(text)))
        .toList();
    update();
  }

  storeData(
      {required BuildContext context,
      required String firstname,
      required String lastname,
      required DateTime bod,
      required int proid,
      required int disid,
      required int villid,
      required String address,
      required String phone,
      required int posid,
      required int roleid,
      required String note}) async {
    DiaLogApp().circleprogressDialog(context);
    try {
      var res = await repository.post(
          url: repository.url + repository.user,
          body: ({
            'firstname': firstname.toString(),
            'lastname': lastname.toString(),
            'bod': bod.toString(),
            'pro_id': proid.toString(),
            'dis_id': disid.toString(),
            'vill_id': villid.toString(),
            'address': address.toString(),
            'phone': phone.toString(),
            'position_id': posid.toString(),
            'password': phone.toString(),
            'role_id': roleid.toString(),
            'note': note.toString()
          }),
          auth: true);
      if (res.statusCode == 200) {
        Navigator.of(context).pop();
        DiaLogApp().successDialog(context, jsonDecode(res.body)['message']);
        print('save user success');
      } else {
        Navigator.of(context).pop();
        DiaLogApp().responemessageDialog(
            context, jsonDecode(res.body)['message'] ?? "");
        print('save user Fail');
      }
    } catch (e) {
      print(e);
    }
  }

  updateData(
      {required BuildContext context,
      required int id,
      required String firstname,
      required String lastname,
      required DateTime bod,
      required int proid,
      required int disid,
      required int villid,
      required String address,
      required String phone,
      required int posid,
      required int roleid,
      required String note}) async {
    DiaLogApp().circleprogressDialog(context);
    try {
      var res = await repository.post(
          url: repository.url + repository.updateuser,
          body: ({
            'id': id.toString(),
            'firstname': firstname.toString(),
            'lastname': lastname.toString(),
            'bod': bod.toString(),
            'pro_id': proid.toString(),
            'dis_id': disid.toString(),
            'vill_id': villid.toString(),
            'address': address.toString(),
            'phone': phone.toString(),
            'position_id': posid.toString(),
            'password': phone.toString(),
            'role_id': roleid.toString(),
            'note': note.toString()
          }),
          auth: true);
      if (res.statusCode == 200) {
        Navigator.of(context).pop();
        DiaLogApp().successDialog(context, jsonDecode(res.body)['message']);
        print('save user success');
      } else {
        Navigator.of(context).pop();
        DiaLogApp().responemessageDialog(
            context, jsonDecode(res.body)['message'] ?? "");
        print('save user Fail');
      }
    } catch (e) {
      print(e);
    }
  }
  showedit(GetUserModel model) {
    editmodel = model;
    update();
  }
}
