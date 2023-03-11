
import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/pages/register_page.dart';
import 'package:cit_academy_app/statemanagement/home_state.dart';
import 'package:cit_academy_app/statemanagement/register_state.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:cit_academy_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  HomeState homeState = Get.put(HomeState());
  RegisterState registerState = Get.put(RegisterState());
  final phoneT = TextEditingController();
  final passwordT = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    phoneT.addListener(() => setState(() {}));
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
        title:  CustomWidget(
          text: 'ເຂົ້າລະບົບ',fontSize: fontsize*0.02,
        ),
        backgroundColor: AppColor().mainColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
            child: Padding(padding:const  EdgeInsets.all(8.0),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h*0.02,
                  ),
                  Image.asset(
                    'images/logo.png',
                    width: ResponsiveWidget.isSmallScreen(context) ? 150 : 300,
                    height: ResponsiveWidget.isSmallScreen(context) ? 150 : 300,
                  ),
                  SizedBox(
                    height: h*0.02,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    child: TextField(
                      controller: phoneT,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        hintText: 'ເບີໂທ',
                        prefixIcon: const Icon(Icons.person),
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
                  SizedBox(
                    height: h * 0.04,
                  ),
                  SizedBox(
                    height: h * 0.06,
                    child: TextField(
                      controller: passwordT,
                      onChanged: (value) => setState(() => password = value),
                      onSubmitted: (value) =>
                          setState(() => password = value),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        hintText: 'ລະຫັດຜ່ານ',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () => setState(
                              () => isPasswordVisible = !isPasswordVisible),
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
                      obscureText: isPasswordVisible,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: CustomWidget(
                        text: 'ລືມລະຫັດຜ່ານ',
                        fontSize: fontsize * 0.01,
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  InkWell(
                      onTap: (() => {
                           if(phoneT.text.trim() =="" || passwordT.text.trim() == ""){
                             DiaLogApp().warningregisterDialog(context)
                           }else{
                              registerState.postSignIn(context: context, phone: phoneT.text, password: passwordT.text)
                           }
                        }),
                    child: ButtonWidget(
                      text: 'ເຂົ້າສູ່ລະບົບ',
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
                    height: h*0.02,
                  ),
                  InkWell(
                    onTap: (() => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegisterPage()))
                        }),
                    child: CustomWidget(
                      text: 'ລົງທະບຽນ',
                      color: Colors.blue,
                      fontSize: fontsize*0.016,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ]),),
        ),
    );
  }
}
