import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/statemanagement/register_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/user/dashboard_student_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    RegisterState registerState = Get.put(RegisterState());
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    double fontsize = size.width + size.height;
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration:  BoxDecoration(
                color: AppColor().mainColor,
              ),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
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
                                          image: AssetImage(
                                            "images/poster.jpg"
                                          ))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () => {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => const DashboardStudentPage(),
                                        ))
                                      },
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
                                          color: Colors.white,
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const CustomWidget(text: 'ທ້າວ ສົນຈິດ ອິນທະວົງ', color: Colors.white,)
                        ],
                      )),
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () => {
              },
              child:  ListTile(
                leading:  Icon(Icons.home, color: AppColor().mainColor),
                title: CustomWidget(text: 'ໜ້າຫຼັກ',fontSize: fontsize*0.012,)
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () => {
              },
              child: ListTile(
                leading:  Icon(Icons.history, color: AppColor().mainColor),
                title: CustomWidget(text: 'ໜ້າຫຼັກ',fontSize: fontsize*0.012,)
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                 registerState.logout(context: context);
              },
              child: ListTile(
                leading:  Icon(Icons.exit_to_app, color: AppColor().mainColor),
                title: CustomWidget(text: 'ອອກລະບົບ',fontSize: fontsize*0.012,)
              ),
            ),
            const Divider(),
          ],
        ),
      );
  }
}