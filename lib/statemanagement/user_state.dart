// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:cit_academy_app/models/get_user_model.dart';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:cit_academy_app/statemanagement/app_verification.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserState extends GetxController {
   AppVerification appVerification = Get.put(AppVerification());
  List<GetUserModel> users = [];
  List<GetUserModel> searchuser = [];
  Repository repository = Repository();
  bool check = false;
  int  countRegister = 0;
  int countUser = 0;
  bool checkRegister = false;
  bool checkcountUser = false;
  getcountUser() async {
    try{
      checkcountUser = false;
          update();
          var res  = await repository.get(url: repository.url + repository.getcountuser, auth: true);
        if(res.statusCode == 200){
            countUser = jsonDecode(res.body)['count'];
            checkcountUser = true;
            update();
        }
    }catch(ex){
       print('count erorr ${ex}');
    }
  }
  getstudentRegister() async {
    try{
      checkRegister = false;
          update();
          var res  = await repository.get(url: repository.url + repository.getstudentRegister, auth: true);
        if(res.statusCode == 200){
            countRegister = jsonDecode(res.body)['count'];
            checkRegister = true;
            update();
        }
    }catch(ex){
       print('count erorr ${ex}');
    }
  }
  getData() async {
    try {
      check = false;
      users = [];
      update();
      var res = await repository.get(
          url: repository.url + repository.user, auth: true);
      if (res.statusCode == 200) {
        for (var data in jsonDecode(res.body)['data']) {
          users.add(GetUserModel.fromJson(data));
        }
        searchuser = users;
        check = true;
        update();
        // ignore: avoid_print
        print('get user success');
      } else {
        check = false;
        // ignore: avoid_print
        print('get Role failed');
      }
    } catch (ex) {
      print(ex);
    }
  }

  searchData(String text) {
    searchuser = users
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
          auth: true
          );
      if (res.statusCode == 200) {
        Navigator.of(context).pop();
        DiaLogApp().successDialog(context, 'ບັນທຶກຂໍ້ມູນສໍາເລັດແລ້ວ');
        // ignore: avoid_print
        print('save user success');
      } else {
       Navigator.of(context).pop();
        DiaLogApp().responemessageDialog(
            context, jsonDecode(res.body)['message'] ?? "");
        // ignore: avoid_print
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
      var res = await http.put(Uri.parse( repository.url + repository.user),
          body: ({
            'id' : id,
            'firstname': firstname,
            'lastname': lastname,
            'bod': bod,
            'pro_id': proid,
            'dis_id': disid,
            'vill_id': villid,
            'address': address,
            'phone': phone,
            'position_id': posid,
            'password': phone,
            'role_id': roleid,
            'note': note
          }),
          headers:
              {
                'Authorization': 'Bearer ${appVerification.token}'
              },
          );
      if (res.statusCode == 200) {
        Navigator.of(context).pop();
        DiaLogApp().successDialog(context, 'ແກ້ໄຂຂໍ້ມູນສໍາເລັດແລ້ວ');
        // ignore: avoid_print
        print('save user success');
      } else {
       Navigator.of(context).pop();
        DiaLogApp().responemessageDialog(
            context, jsonDecode(res.body)['message'] ?? "");
        // ignore: avoid_print
        print('save user Fail');
      }
    } catch (e) {
      print(e);
    }
  }
}
