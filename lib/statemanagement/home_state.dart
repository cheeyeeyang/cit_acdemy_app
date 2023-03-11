
import 'package:get/get.dart';
class HomeState extends GetxController {
  bool check = false;
  int currentPage = 0;
  Stream<bool> checkData() async* {
    yield check;
  }
  setCurrentPage(int page) {
    currentPage = page;
    update();
  }
  getPageChoose() {}
}
