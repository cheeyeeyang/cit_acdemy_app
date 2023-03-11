import 'dart:convert';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:get/get.dart';
import '../models/role_model.dart';

class RoleState extends GetxController {
  List<RoleModel> roles = [];
  List<RoleModel> searchroles = [];
  Repository repository = Repository();
  bool check = false;
  getData() async {
    roles = [];
    update();
    var res =
        await repository.get(url: repository.url + repository.role, auth: true);
    if (res.statusCode == 200) {
      for (var data in jsonDecode(res.body)['data']) {
        roles.add(RoleModel.fromJson(data));
      }
      searchroles = roles;
      check = true;
      update();
      // ignore: avoid_print
      print('get Roles success');
    } else {
      check = false;
      // ignore: avoid_print
      print('get Role failed');
    }
  }

  searchData(String text) {
    searchroles =
        roles.where((e) => (e.name.toString().contains(text))).toList();
    update();
  }
}
