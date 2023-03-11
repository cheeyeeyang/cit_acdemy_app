import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/models/get_user_model.dart';
import 'package:cit_academy_app/models/land_model.dart';
import 'package:cit_academy_app/statemanagement/date_picker_state.dart';
import 'package:cit_academy_app/statemanagement/land_state.dart';
import 'package:cit_academy_app/statemanagement/user_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/format_date.dart';

class UserEditPage extends StatefulWidget {
  final GetUserModel user;
  const UserEditPage({super.key,required this.user});
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  DatePickerState datePickerState = Get.put(DatePickerState());
  TextEditingController firstnameT = TextEditingController();
  TextEditingController lastnameT = TextEditingController();
  TextEditingController phoneT = TextEditingController();
  TextEditingController bod = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController note = TextEditingController();
  LandState landState = Get.put(LandState());
  UserState userState = Get.put(UserState());
  int? id;
  @override
  void initState() {
    getUser();
    super.initState();
  }
   getUser() {
    id = widget.user.id;
    firstnameT.text = widget.user.firstname.toString();
    lastnameT.text = widget.user.lastname.toString();
    address.text = widget.user.address.toString();
    phoneT.text = widget.user.phone.toString();
    note.text = widget.user.note.toString();
  }
  resetField() {
    firstnameT.text == "";
    lastnameT.text == "";
    datePickerState.dateFrom == null;
    landState.positionSelect == null;
    landState.districtSelect == null;
    landState.villageSelect == null;
    address.text == "";
    phoneT.text == "";
    landState.positionSelect == null;
    note.text == "";
    landState.selectRoleSelect == null;
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
          text: 'ແກ້ໄຂຜູ້ໃຊ້ລະບົບ',
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
            SizedBox(
              height: height * 0.07,
              child: Row(
                children: [
                  Expanded(
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
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
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
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.07,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: bod,
                      readOnly: true,
                      onTap: () async {
                        await datePickerState.selectDateFrom(context: context);
                        bod.text = FormatDate(
                                dateTime: datePickerState.dateFrom.toString())
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
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
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
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.07,
              child: Row(
                children: [
                  Expanded(
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
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
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
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.07,
              child: Row(
                children: [
                  Expanded(
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
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
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
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.07,
              child: Row(
                children: [
                  Expanded(
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
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
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
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.07,
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
              children: [
                Expanded(
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
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                          userState.updateData(
                          context: context,
                          id : id ?? 0,
                          firstname: firstnameT.text,
                          lastname: lastnameT.text,
                          bod:  datePickerState.dateFrom ?? DateTime.now(),
                          proid: landState.positionSelect!.id ?? 0,
                          disid: landState.districtSelect!.id ?? 0,
                          villid: landState.villageSelect!.id ?? 0,
                          address: address.text,
                          phone: phoneT.text,
                          posid: landState.positionSelect!.id ?? 0,
                          roleid: landState.selectRoleSelect!.id ?? 0,
                          note: note.text);
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
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
