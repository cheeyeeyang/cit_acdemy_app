import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/statemanagement/date_picker_state.dart';
import 'package:cit_academy_app/statemanagement/land_state.dart';
import 'package:cit_academy_app/statemanagement/payment_state.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:cit_academy_app/widgets/drop_down_widget.dart';
import 'package:cit_academy_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/get_student_model.dart';

class FromPaymentPage extends StatefulWidget {
  final GetStudentModel user;
  const FromPaymentPage({super.key, required this.user});

  @override
  State<FromPaymentPage> createState() => _FromPaymentPageState();
}

class _FromPaymentPageState extends State<FromPaymentPage> {
    var formatter = NumberFormat('#,###,000');
  LandState landState = Get.put(LandState());
  DatePickerState datePickerState = Get.put(DatePickerState());
  TextEditingController des = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController amount = TextEditingController();
  PaymentState paymentState = Get.put(PaymentState());
  String year = '2022';
  String month = '01';
  List<String> monthitems = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];
  List<String> yearitems = <String>[
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027'
  ];
  @override
  void initState() {
    super.initState();
  }

  resetField() {
    des.text = "";
    note.text = "";
    amount.text = "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomWidget(
          text: 'ຊໍາລະຄ່າຮຽນ',
          fontSize: fontsize * 0.018,
        ),
        backgroundColor: AppColor().mainColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ເດືອນ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  DropDownWidget<String>(
                      fixSize: 18,
                      appColor: Colors.white,
                      value: month,
                      hint: 'ເລືອກ',
                      listMenuItems: monthitems.map((e) {
                        return DropdownMenuItem(
                            value: e,
                            child: CustomWidget(
                              text: e,
                            ));
                      }).toList(),
                      onChange: (value) {
                        setState(() {
                          month = value!;
                        });
                      })
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ປີ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  DropDownWidget<String>(
                      fixSize: 18,
                      appColor: Colors.white,
                      value: year,
                      hint: 'ເລືອກ',
                      listMenuItems: yearitems.map((e) {
                        return DropdownMenuItem(
                            value: e,
                            child: CustomWidget(
                              text: e,
                            ));
                      }).toList(),
                      onChange: (value) {
                        setState(() {
                          year = value!;
                        });
                      })
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ຄ່າຮຽນ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                        inputFormatters: [
                             FilteringTextInputFormatter.digitsOnly,
                        ],
                      controller: amount,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ຄ່າຮຽນ',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: AppColor().thirdColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.5, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ຄໍາອະທິບາຍ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: des,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ຄໍາອະທິບາຍ',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: AppColor().thirdColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.5, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ໝາຍເຫດ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: note,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ໝາຍເຫດ',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: AppColor().thirdColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.5, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              GestureDetector(
                onTap: (() => {
                      if (des.text.trim() == "" ||
                          amount.text.trim() == "" ||
                          year == "" ||
                          month == "")
                        {DiaLogApp().pleaseenteralltextDialog(context)}
                      else
                        {
                          paymentState.savePayment(
                              context: context,
                              des: des.text,
                              amount: amount.text,
                              note: note.text,
                              month: month,
                              year: year,
                              userid: widget.user.id ?? 0),
                          resetField()
                        }
                    }),
                child: ButtonWidget(
                  text: 'ຊໍາລະຄ່າຮຽນ',
                  width: w,
                  height: ResponsiveWidget.isSmallScreen(context)
                      ? h * 0.06
                      : ResponsiveWidget.isMediumScreen(context)
                          ? h * 0.07
                          : h * 0.08,
                  borderRadius: 10.0,
                  backgroundcolor: AppColor().mainColor,
                  color: Colors.white,
                  fontSize: fontsize * 0.016,
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
