import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/models/land_model.dart';
import 'package:cit_academy_app/pages/login_page.dart';
import 'package:cit_academy_app/statemanagement/date_picker_state.dart';
import 'package:cit_academy_app/statemanagement/land_state.dart';
import 'package:cit_academy_app/statemanagement/register_state.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:cit_academy_app/widgets/drop_down_widget.dart';
import 'package:cit_academy_app/widgets/format_date.dart';
import 'package:cit_academy_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  LandState landState = Get.put(LandState());
  DatePickerState datePickerState = Get.put(DatePickerState());
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController bod = TextEditingController();
  TextEditingController sizeT = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController note = TextEditingController();
  RegisterState registerState = Get.put(RegisterState());
  @override
  void initState() {
    super.initState();
  }
  resetField(){
    firstname.text = "";
    lastname.text = "";
    bod.text = "";
    sizeT.text = "";
    number.text = "";
    address.text = "";
    phone.text  = "";
    note.text = "";
    landState.clearData();
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
          text: 'ລົງທະບຽນ',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ຊື່',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: firstname,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ຊື່',
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
                    text: 'ນາມສະກຸນ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: lastname,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ນາມສະກຸນ',
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
                    text: 'ວັນ/ເດືອນ/ປີເກີດ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: bod,
                      readOnly: true,
                      onTap: () async {
                        await datePickerState.selectDateFrom(context: context);
                        bod.text = FormatDate(
                                dateTime: datePickerState.dateFrom.toString())
                            .toString();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ວັນ/ເດືອນ/ປີເກີດ',
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
                    text: 'ເບີໂທ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: phone,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ເບີໂທ',
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
                    text: 'ຂະໜາດເສື້ອ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: sizeT,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'M',
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
              SizedBox(
                height: h * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ເບີເສື້ອ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: '7',
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
                    text: 'ທີ່ຢູ່',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
                    child: TextField(
                      controller: address,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintText: 'ຖະໜົມດົງ ຮ່ອມທີ 3',
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
                    text: 'ແຂວງ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  GetBuilder<LandState>(builder: (get) {
                    return DropDownWidget<ProvinceModel>(
                        fixSize: 18,
                        appColor: Colors.white,
                        value: landState.provinceSelect,
                        hint: 'ເລືອກ',
                        listMenuItems: landState.allProvinces.map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: CustomWidget(
                                text: e.name ?? '',
                              ));
                        }).toList(),
                        onChange: (v) {
                          landState.updateDropDownProvince(v);
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
                    text: 'ເມືອງ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  GetBuilder<LandState>(builder: (get) {
                    return DropDownWidget<DistrictsModel>(
                        fixSize: 18,
                        appColor: Colors.white,
                        value: landState.districtSelect,
                        hint: 'ເລືອກ',
                        listMenuItems: landState.allDistricts.map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: CustomWidget(
                                text: e.name ?? '',
                              ));
                        }).toList(),
                        onChange: (v) {
                          landState.updateDropDownDistrict(v);
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
                    text: 'ບ້ານ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  GetBuilder<LandState>(builder: (get) {
                    return DropDownWidget<VillagesModel>(
                        fixSize: 18,
                        appColor: Colors.white,
                        value: get.villageSelect,
                        hint: 'ເລືອກ',
                        listMenuItems: get.allVillages.map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: CustomWidget(
                                text: e.name ?? '',
                              ));
                        }).toList(),
                        onChange: (v) {
                          get.updateDropDownVillage(v);
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
                      if (firstname.text.trim() == "" ||
                          lastname.text.trim() == "" ||
                          bod.text.trim() == "" ||
                          sizeT.text.trim() == "" ||
                          number.text.trim() == "" ||
                          landState.provinceSelect == null ||
                          landState.districtSelect ==null ||
                          landState.villageSelect == null ||
                          phone.text.trim() == "")
                        {
                          DiaLogApp().pleaseenteralltextDialog(context)
                        }
                      else
                        {
                          registerState.postRegister(
                              context: context,
                              firstname: firstname.text,
                              lastname: lastname.text,
                              size: sizeT.text,
                              number: number.text,
                              proid: landState.provinceSelect!.id.toString(),
                              disid: landState.districtSelect!.id.toString(),
                              villid: landState.villageSelect!.id.toString(),
                              address: address.text,
                              phone: phone.text,
                              note: note.text),
                              resetField()
                        }
                    }),
                child: ButtonWidget(
                  text: 'ລົງທະບຽນ',
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
              CustomWidget(
                text: 'ຫຼື',
                fontSize: fontsize * 0.013,
              ),
              TextButton(
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()))
                },
                child: CustomWidget(
                  text: 'ເຂົ້າສູ່ລະບົບ',
                  fontSize: fontsize * 0.014,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
