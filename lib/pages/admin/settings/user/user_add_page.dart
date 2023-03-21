import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/models/land_model.dart';
import 'package:cit_academy_app/models/user_model.dart';
import 'package:cit_academy_app/statemanagement/date_picker_state.dart';
import 'package:cit_academy_app/statemanagement/land_state.dart';
import 'package:cit_academy_app/statemanagement/user_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../widgets/format_date.dart';

class UserAddPage extends StatefulWidget {
  const UserAddPage({super.key});
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  DatePickerState datePickerState = Get.put(DatePickerState());
  TextEditingController firstnameT = TextEditingController();
  TextEditingController lastnameT = TextEditingController();
  TextEditingController phoneT = TextEditingController();
  TextEditingController bod = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController note = TextEditingController();
  LandState landState = Get.put(LandState());
  UserState userState = Get.put(UserState());
  resetField() {
    firstnameT.text == "";
    lastnameT.text == "";
    datePickerState.boddate == null;
    landState.positionSelect == null;
    landState.districtSelect == null;
    landState.villageSelect == null;
    address.text == "";
    phoneT.text == "";
    landState.positionSelect == null;
    note.text == "";
    landState.selectRoleSelect == null;
  }

  showedit() {
    firstnameT.text = userState.editmodel?.firstname.toString() ?? "";
    lastnameT.text = userState.editmodel?.lastname ?? "";
    datePickerState.boddate = DateTime.parse(userState.editmodel?.bod ?? ""); 
    bod.text =
        FormatDate(dateTime: userState.editmodel?.bod.toString()).toString();
    address.text = userState.editmodel?.address.toString() ?? "";
    phoneT.text = userState.editmodel?.phone.toString() ?? "";
    note.text = userState.editmodel?.note.toString() ?? "";
  }

  @override
  void initState() {
    landState.setAddress(userState.editmodel);
    showedit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsize = width + height;
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: CustomWidget(
          text: 'ຜູ້ໃຊ້ລະບົບ',
          fontSize: fontsize * 0.016,
        ),
        backgroundColor: AppColor().mainColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: TextFormField(
                    controller: firstnameT,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "ຊື່",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: TextFormField(
                    controller: lastnameT,
                    keyboardType: TextInputType.number,
                    // ignore: unnecessary_new
                    decoration: new InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "ນາມສະກຸນ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: TextFormField(
                    controller: bod,
                    readOnly: true,
                    onTap: () async {
                      await datePickerState.selectDateBod(context: context);
                      bod.text = FormatDate(
                              dateTime: datePickerState.boddate.toString())
                          .toString();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "ວັນ/ເດືອນ/ປີເກີດ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: phoneT,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "ເບີໂທ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: GetBuilder<LandState>(
                        builder: (get) {
                          return DropdownButton<ProvinceModel>(
                            isExpanded: true,
                            isDense: true,
                            hint: const CustomWidget(text: 'ແຂວງ'),
                            underline: const SizedBox(),
                            iconSize: 36,
                            onChanged: (v) {
                              get.updateDropDownProvince(v);
                            },
                            value: landState.provinceSelect,
                            items: landState.allProvinces.map((e) {
                              return DropdownMenuItem(
                                  value: e,
                                  child: CustomWidget(
                                    text: e.name ?? '',
                                  ));
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: GetBuilder<LandState>(
                        builder: (get) {
                          return DropdownButton<DistrictsModel>(
                            isExpanded: true,
                            hint: const CustomWidget(text: 'ເມືອງ'),
                            underline: const SizedBox(),
                            iconSize: 36,
                            onChanged: (v) => {get.updateDropDownDistrict(v)},
                            isDense: true,
                            value: landState.districtSelect,
                            items: landState.allDistricts.map((e) {
                              return DropdownMenuItem(
                                  value: e,
                                  child: CustomWidget(
                                    text: e.name ?? '',
                                  ));
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: GetBuilder<LandState>(
                        builder: (get) {
                          return DropdownButton<VillagesModel>(
                            hint: const CustomWidget(text: 'ບ້ານ'),
                            isExpanded: true,
                            underline: const SizedBox(),
                            iconSize: 36,
                            onChanged: (v) => {get.updateDropDownVillage(v)},
                            value: landState.villageSelect,
                            items: landState.allVillages.map((e) {
                              return DropdownMenuItem(
                                  value: e,
                                  child: CustomWidget(
                                    text: e.name ?? '',
                                  ));
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: GetBuilder<LandState>(
                        builder: (get) {
                          return DropdownButton<PositionModel>(
                            hint: const CustomWidget(text: 'ຕໍາແໜ່ງ'),
                            isExpanded: true,
                            underline: const SizedBox(),
                            iconSize: 36,
                            onChanged: (v) => {get.updateDropDownPosition(v)},
                            value: landState.positionSelect,
                            items: landState.allPositions.map((e) {
                              return DropdownMenuItem(
                                  value: e,
                                  child: CustomWidget(
                                    text: e.name ?? '',
                                  ));
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: TextFormField(
                    controller: address,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "ທີ່ຢູ່",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: GetBuilder<LandState>(
                        builder: (get) {
                          return DropdownButton<SelectRoleModel>(
                            isExpanded: true,
                            hint: const CustomWidget(text: 'ສິດນໍາໃຊ້ລະບົບ'),
                            underline: const SizedBox(),
                            iconSize: 36,
                            onChanged: (v) => {get.updateDropDownRole(v)},
                            value: landState.selectRoleSelect,
                            items: landState.allselectroles.map((e) {
                              return DropdownMenuItem(
                                  value: e,
                                  child: CustomWidget(
                                    text: e.name ?? '',
                                  ));
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.06,
              child: TextFormField(
                controller: note,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "ໝາຍເຫດ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      resetField();
                      Navigator.pop(context);
                    },
                    // ignore: sort_child_properties_last
                    child: CustomWidget(
                      text: "ຍົກເລີກ",
                      fontSize: fontsize * 0.016,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    ),
                  ),
                ),
                GetBuilder<UserState>(
                  builder: (get) {
                    if(get.editmodel !=null){
                      return SizedBox(
                      height: height * 0.06,
                      width: width * 0.45,
                      child: ElevatedButton(
                        onPressed: () {
                          if (firstnameT.text.trim() == "" ||
                              lastnameT.text.trim() == "" ||
                              datePickerState.boddate == null ||
                              landState.positionSelect!.id == null ||
                              landState.districtSelect!.id == null ||
                              landState.villageSelect!.id == null ||
                              address.text.trim() == "" ||
                              phoneT.text.trim() == "" ||
                              landState.selectRoleSelect!.id == null) {
                            DiaLogApp().pleaseenteralltextDialog(context);
                          } else {
                            userState.updateData(
                                id: userState.editmodel?.id ?? 0,
                                context: context,
                                firstname: firstnameT.text,
                                lastname: lastnameT.text,
                                bod: datePickerState.boddate ?? DateTime.now(),
                                proid: landState.positionSelect!.id ?? 0,
                                disid: landState.districtSelect!.id ?? 0,
                                villid: landState.villageSelect!.id ?? 0,
                                address: address.text,
                                phone: phoneT.text,
                                posid: landState.positionSelect!.id ?? 0,
                                roleid: landState.selectRoleSelect!.id ?? 0,
                                note: note.text);
                          }
                          resetField();
                        },
                        // ignore: sort_child_properties_last
                        child: CustomWidget(
                          text: "ແກ້ໄຂ",
                          fontSize: fontsize * 0.016,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                      ),
                    );
                    }
                    return SizedBox(
                      height: height * 0.06,
                      width: width * 0.45,
                      child: ElevatedButton(
                        onPressed: () {
                          if (firstnameT.text.trim() == "" ||
                              lastnameT.text.trim() == "" ||
                              datePickerState.boddate == null ||
                              landState.positionSelect!.id == null ||
                              landState.districtSelect!.id == null ||
                              landState.villageSelect!.id == null ||
                              address.text.trim() == "" ||
                              phoneT.text.trim() == "" ||
                              landState.selectRoleSelect!.id == null) {
                            DiaLogApp().pleaseenteralltextDialog(context);
                          } else {
                            userState.storeData(
                                context: context,
                                firstname: firstnameT.text,
                                lastname: lastnameT.text,
                                bod: datePickerState.boddate ?? DateTime.now(),
                                proid: landState.positionSelect!.id ?? 0,
                                disid: landState.districtSelect!.id ?? 0,
                                villid: landState.villageSelect!.id ?? 0,
                                address: address.text,
                                phone: phoneT.text,
                                posid: landState.positionSelect!.id ?? 0,
                                roleid: landState.selectRoleSelect!.id ?? 0,
                                note: note.text);
                          }
                          resetField();
                        },
                        // ignore: sort_child_properties_last
                        child: CustomWidget(
                          text: "ບັນທຶກ",
                          fontSize: fontsize * 0.016,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                      ),
                    );
                  }
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
