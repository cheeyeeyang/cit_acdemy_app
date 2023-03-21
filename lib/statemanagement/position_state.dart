
// ignore_for_file: avoid_print, use_build_context_synchronously
import 'dart:convert';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/position_model.dart';
class PositionState extends GetxController {
  List<PositionModel> data = [];
  List<PositionModel> searchdata = [];
  Repository repository = Repository();
  PositionModel ? showmodel;
  bool check = false;
  getData() async{
    data = [];
    check =  false;
    update();
   var res = await repository.get(url: repository.url+repository.position, auth: true);
   if(res.statusCode == 200){
      for(var item in jsonDecode(res.body)['data']){
        data.add(PositionModel.fromJson(item));
      }
      searchdata = data;
      check = true;
      update();
      print('get position success');
   }else{
     print('get position failed');
   }
  }
  searchData(String text){
     searchdata = data.where((e) => (e.name.toString().contains(text) || e.createdAt.toString().contains(text))).toList();
     update();
  }
  saveData({required BuildContext context, required String name}) async {
    DiaLogApp().circleprogressDialog(context);
    var res = await repository.post(url: repository.url + repository.position,
    body: ({
      'name' : name.toString()
    }),
    auth: true);
    if(res.statusCode == 200){
       Navigator.pop(context);
       DiaLogApp().successDialog(context, jsonDecode(res.body)['message']);
    }else{
       Navigator.pop(context);
       DiaLogApp().warningDialog(context, jsonDecode(res.body)['message']);
    }
  }
  showEdit(PositionModel model){
      showmodel = model;
      update();
  }
  updateData({required BuildContext context,required int id, required String name}) async {
    DiaLogApp().circleprogressDialog(context);
    var res = await repository.post(url: repository.url + repository.updateposition,
    body: ({
      'id' : id.toString(),
      'name' : name.toString()
    }),
    auth: true);
    if(res.statusCode == 200){
       Navigator.pop(context);
       DiaLogApp().successDialog(context, jsonDecode(res.body)['message']);
    }else{
       Navigator.pop(context);
       DiaLogApp().warningDialog(context, jsonDecode(res.body)['message']);
    }
  }
}
