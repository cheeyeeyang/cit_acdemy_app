import 'dart:convert';

import 'package:cit_academy_app/repository/repository.dart';
import 'package:get/get.dart';

class HomeState extends GetxController {
  Repository repository = Repository();
  int sumexpense = 0;
  int sumincome = 0;
  bool check = false;
  int currentPage = 0;
  bool checkIncome = false;
  bool checkExpense = false;
  Stream<bool> checkData() async* {
    yield check;
  }

  setCurrentPage(int page) {
    currentPage = page;
    update();
  }

  getsumExpense() async {
      var res = await repository.get(
        url: repository.url + repository.getsumexpense, auth: true);

      if (res.statusCode == 200) {
        sumexpense = int.parse(jsonDecode(res.body)['sum']);
        checkExpense = true;
        update();
      }
  }

  getsumIncome() async {
    var res = await repository.get(
        url: repository.url + repository.getsumincome, auth: true);
    if (res.statusCode == 200) {
      sumincome = int.parse(jsonDecode(res.body)['sum']);
      checkIncome = true;
      update();
    }
  }
}
