// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:cit_academy_app/models/get_student_model.dart';
import 'package:cit_academy_app/pages/admin/bill_page.dart';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/bill_model.dart';

class PaymentState extends GetxController {
  List<GetStudentModel> data = [];
  List<GetStudentModel> searchdata = [];
  Repository repository = Repository();
  BillModel? billModel;
  bool checkBill = false;
  bool check = false;
  getData() async {
    try {
      data = [];
      check = false;
      update();
      var res = await repository.get(
          url: repository.url + repository.getstudent, auth: true);
      if (res.statusCode == 200) {
        for (var item in jsonDecode(res.body)['data']) {
          data.add(GetStudentModel.fromJson(item));
        }
        searchdata = data;
        check = true;
        update();
        // ignore: avoid_print
        print('get data success');
      } else {
        check = false;
        // ignore: avoid_print
        print('get data failed');
      }
    } catch (ex) {
      print(ex);
    }
  }

  searchData(String text) {
    searchdata = data
        .where((e) => (e.firstname.toString().contains(text) ||
            e.lastname.toString().contains(text) ||
            e.phone.toString().contains(text)))
        .toList();
    update();
  }

  savePayment(
      {required BuildContext context,
      required int userid,
      required String des,
      required String note,
      required String amount,
      required String month,
      required String year}) async {
    DiaLogApp().circleprogressDialog(context);
    try {
      checkBill = false;
      update();
      var res = await repository.post(
          url: repository.url + repository.payment,
          body: ({
            'user_id': userid.toString(),
            'amount': amount.toString(),
            'des': des.toString(),
            'note': note.toString(),
            'year': year.toString(),
            'month': month.toString()
          }),
          auth: true);
      if (res.statusCode == 200) {
        billModel = BillModel.fromJson(jsonDecode(res.body)['data']);
        checkBill = true;
        update();
        Navigator.of(context).pop();
        print('save payment success');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const BillPage()));
      } else {
        Navigator.of(context).pop();
        DiaLogApp().responemessageDialog(
            context, jsonDecode(res.body)['message'] ?? "");
        print('save payment Fail');
      }
    } catch (e) {
      print(e);
    }
  }
}
