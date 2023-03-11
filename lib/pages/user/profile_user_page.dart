import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/statemanagement/register_state.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  TextEditingController firstnameT = TextEditingController();
  TextEditingController lastnameT = TextEditingController();
  TextEditingController phoneT = TextEditingController();
  TextEditingController bodT = TextEditingController();
  TextEditingController addressT = TextEditingController();
  TextEditingController noteT = TextEditingController();
  TextEditingController provinceT = TextEditingController();
  TextEditingController districtT = TextEditingController();
  TextEditingController villageT = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    double h = size.height;
    double w = size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<RegisterState>(builder: (get) {
          if (get.check == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          firstnameT.text = '${get.userModel?.firstname.toString()}';
          lastnameT.text = '${get.userModel?.lastname.toString()}';
          phoneT.text = '${get.userModel?.phone.toString()}';
          addressT.text = '${get.userModel?.address.toString()}';
          noteT.text = '${get.userModel?.note.toString()}';
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: ResponsiveWidget.isSmallScreen(context)
                                      ? 150
                                      : 250,
                                  height:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 150
                                          : 250,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: const Offset(0, 10))
                                      ],
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("images/yard.jpg"))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () => {},
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          color: AppColor().mainColor,
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget(
                    text: 'ຊື່',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    child: TextField(
                      controller: firstnameT,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'ຊື່',
                        suffixIcon: firstnameT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => firstnameT.clear(),
                              ),
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
                    height: h * 0.06,
                    child: TextField(
                      controller: lastnameT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'ນາມສະກຸນ',
                        suffixIcon: lastnameT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => lastnameT.clear(),
                              ),
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
                    text: 'ວັນເດືອນປີເກີດ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    child: TextField(
                      controller: bodT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'ວັນເດືອນປີເກີດ',
                        suffixIcon: bodT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => bodT.clear(),
                              ),
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
                    height: h * 0.06,
                    child: TextField(
                      controller: phoneT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'ເບີໂທ',
                        suffixIcon: phoneT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => phoneT.clear(),
                              ),
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
                    height: h * 0.06,
                    child: TextField(
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'M',
                        suffixIcon: firstnameT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => firstnameT.clear(),
                              ),
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
                    height: h * 0.06,
                    child: TextField(
                      controller: phoneT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: '7',
                        suffixIcon: phoneT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => phoneT.clear(),
                              ),
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
                  SizedBox(
                    height: h * 0.06,
                    child: TextField(
                      controller: noteT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'ແຂວງ',
                        suffixIcon: noteT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => noteT.clear(),
                              ),
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
                    text: 'ເມືອງ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    child: TextField(
                      controller: firstnameT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'ເມືອງ',
                        suffixIcon: firstnameT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => firstnameT.clear(),
                              ),
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
                    text: 'ບ້ານ',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    child: TextField(
                      controller: lastnameT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) => setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'ບ້ານ',
                        suffixIcon: lastnameT.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => lastnameT.clear(),
                              ),
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
              ButtonWidget(
                text: 'ແກ້ໄຂ',
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
            ],
          );
        }),
      ),
    );
  }
}
