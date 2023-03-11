import 'dart:async';
import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/pages/poster_page.dart';
import 'package:cit_academy_app/statemanagement/register_state.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterSuccessPage extends StatefulWidget {
  const RegisterSuccessPage({super.key});

  @override
  State<RegisterSuccessPage> createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  RegisterState registerState = Get.put(RegisterState());
  final usernameT = TextEditingController();
  final passwordT = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      registerState.setcheckSuccess(true);
    });
    super.initState();
    usernameT.addListener(() => setState(() {}));
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
          text: 'ລົງທະບຽນສໍາເລັດ',
          fontSize: fontsize * 0.02,
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
            child: GetBuilder<RegisterState>(builder: (get) {
              if (get.checkRegister == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      Icons.check_circle_outline,
                      size: fontsize * 0.16,
                      color: Colors.green,
                    ),
                  ),
                  Center(
                    child: CustomWidget(
                      text: 'ສໍາເລັດແລ້ວ',
                      fontSize: fontsize * 0.02,
                      fontWeight: FontWeight.w300,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Center(
                    child: CustomWidget(
                      text:
                          get.registerSuccessModel?.createdDate.toString() ?? "",
                      fontSize: fontsize * 0.013,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  CustomWidget(
                    text: 'ຊື່:',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  CustomWidget(
                    text: get.registerSuccessModel?.firstname.toString() ?? "",
                    fontSize: fontsize * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  CustomWidget(
                    text: 'ນາມສະກຸນ:',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  CustomWidget(
                    text: get.registerSuccessModel?.lastname.toString() ?? "",
                    fontSize: fontsize * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  CustomWidget(
                    text: 'ວັນເດືອນປີເກີດ:',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  CustomWidget(
                    text: get.registerSuccessModel?.bod.toString() ?? "",
                    fontSize: fontsize * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidget(
                        text: 'ເບີໂທ:',
                        fontSize: fontsize * 0.013,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                      CustomWidget(
                        text: get.registerSuccessModel?.phone.toString() ?? "",
                        fontSize: fontsize * 0.018,
                        fontWeight: FontWeight.bold,
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
                        text: 'ຂະໜາດເສື້ອ:',
                        fontSize: fontsize * 0.013,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                      CustomWidget(
                        text: get.registerSuccessModel?.size.toString() ?? "",
                        fontSize: fontsize * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  CustomWidget(
                    text: 'ເບີເສື້ອ:',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  CustomWidget(
                    text: get.registerSuccessModel?.number.toString() ?? "",
                    fontSize: fontsize * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  CustomWidget(
                    text: 'ບ້ານ:',
                    fontSize: fontsize * 0.013,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  CustomWidget(
                    text: get.registerSuccessModel?.village.toString() ?? "",
                    fontSize: fontsize * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidget(
                        text: 'ເມືອງ:',
                        fontSize: fontsize * 0.013,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                      CustomWidget(
                        text:
                            get.registerSuccessModel?.district.toString() ?? "",
                        fontSize: fontsize * 0.018,
                        fontWeight: FontWeight.bold,
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
                        text: 'ແຂວງ:',
                        fontSize: fontsize * 0.013,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                      CustomWidget(
                        text:
                            get.registerSuccessModel?.province.toString() ?? "",
                        fontSize: fontsize * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  GestureDetector(
                    onTap: (() => {
                          Navigator.of(context).pop()
                        }),
                    child: ButtonWidget(
                      text: 'ສໍາເລັດແລ້ວ',
                      width: w,
                      height: ResponsiveWidget.isSmallScreen(context)
                          ? h * 0.06
                          : ResponsiveWidget.isMediumScreen(context)
                              ? h * 0.07
                              : h * 0.08,
                      borderRadius: 10.0,
                      backgroundcolor: AppColor().mainColor,
                      color: Colors.white,
                      fontSize: fontsize * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              );
            })),
      ),
    );
  }
}
