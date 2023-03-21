// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:cit_academy_app/models/expense_model.dart';
import 'package:cit_academy_app/pages/admin/expens/expend_page.dart';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseState extends GetxController{
  Repository repository = Repository();
    List<ExpenseModel> data = [];
    List<ExpenseModel> searchdata = [];
    ExpenseModel ? showmodel;
    bool check = false;
    getData() async{
       var res = await  repository.get(url: repository.url+repository.getexpense, auth: true);
       if(res.statusCode == 200){
          data = [];
          update();
          for(var item in jsonDecode(res.body)['data']){
            data.add(ExpenseModel.fromJson(item));
          }
          searchdata = data;
          check = true;
          update();
          print('get expense success');
       }else{
         check = false;
         update();
        print('get expense success');
       }
    }
    saveData(
      {
        required BuildContext context,
        required String amount, 
        required String des,
      }
    ) async {
      DiaLogApp().circleprogressDialog(context);
      var res =  await repository.post(url: repository.url + repository.addexpense, auth: true, body: ({
        'amount':amount.toString(),
        'des' : des.toString(),
      }));
      if(res.statusCode == 200){
         Navigator.pop(context);
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExpenPage()));
         print('add expense success');
      }else{
          Navigator.pop(context);
          DiaLogApp().responemessageDialog(context, jsonDecode(res.body)['message']);
          print('add expense failed');
      }
    }
    updateData(
      {
        required BuildContext context,
        required int id,
        required String amount, 
        required String des,
      }
    ) async {
      DiaLogApp().circleprogressDialog(context);
      var res =  await repository.post(url: repository.url + repository.updateexpense, auth: true, body: ({
        'amount':amount.toString(),
        'des' : des.toString(),
        'id' : id.toString()
      }));
      if(res.statusCode == 200){
         Navigator.pop(context);
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExpenPage()));
      }else{
          Navigator.pop(context);
          DiaLogApp().responemessageDialog(context, jsonDecode(res.body)['message']);
          print('edit expense failed');
      }
    }
    searchData(String text){
       searchdata = data.where((e) => (e.amount.toString().contains(text) || e.des.toString().contains(text))).toList();
       update();
    }
    showEdit(ExpenseModel model){
     showmodel =  model;
     update();
    }
}