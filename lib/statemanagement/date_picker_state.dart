import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerState extends GetxController {
  DateTime? dateFrom;
  DateTime? boddate;
  selectDateFrom({required BuildContext context}) async {
    var date = await showDatePicker(
        context: context,
        initialDate: dateFrom ?? DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 16),
        lastDate: DateTime(DateTime.now().year + 2),
        currentDate: dateFrom);
    if (date != null) {
      dateFrom = date;
    }
    update();
  }
  selectDateBod({required BuildContext context}) async {
    var date = await showDatePicker(
        context: context,
        initialDate: boddate ?? DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 2),
        currentDate: boddate);
    if (date != null) {
      boddate = date;
    }
    update();
  }

}
