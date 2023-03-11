import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerState extends GetxController {
  DateTime? dateFrom;
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

}
