import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/pages/admin/admin_home_page.dart';
import 'package:cit_academy_app/pages/user/dashboard_student_page.dart';
import 'package:cit_academy_app/pages/user/profile_user_page.dart';
import 'package:cit_academy_app/statemanagement/home_state.dart';
import 'package:cit_academy_app/statemanagement/register_state.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  RegisterState registerState = Get.put(RegisterState());
  List<Widget> page = [
    GetBuilder<RegisterState>(
      builder: (get) {
        if(get.userModel?.roleId !=3){
           return const AdminHomePage();
        }else{
          return  const DashboardStudentPage();
        }
      }
    ),
    const ProfileUserPage()
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          flexibleSpace: SafeArea(
            child: Container(
              color: AppColor().mainColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 4,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset:
                                                          const Offset(0, 10))
                                                ],
                                                shape: BoxShape.circle,
                                                image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "images/avatar.jpg"))),
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
                        const SizedBox(
                          width: 10,
                        ),
                        GetBuilder<RegisterState>(
                          builder: (get) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomWidget(
                                  text: '${get.userModel?.firstname.toString()} ${get.userModel?.lastname.toString()}',
                                  fontSize: fontsize * 0.012,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                CustomWidget(
                                  text: 'ເບີໂທ: ${get.userModel?.phone.toString()}',
                                  fontSize: fontsize * 0.01,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            );
                          }
                        ),
                      ],
                    ),
                    Positioned(
                        left: size.width * 0.65,
                        top: 60,
                        child: GestureDetector(
                          onTap: ()=>{
                            registerState.logout(context: context)
                          },
                          child: ButtonWidget(
                            text: 'ອອກຈາກລະບົບ',
                            width: 120,
                            height: 40,
                            fontWeight: FontWeight.bold,
                            borderRadius: 20.0,
                            backgroundcolor: Colors.white,
                            color: AppColor().mainColor,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        body: GetBuilder<HomeState>(
          builder: (get) {
            return page[get.currentPage];
          },
        ),
        bottomNavigationBar: GetBuilder<HomeState>(builder: (getPage) {
          return GetBuilder<RegisterState>(
            builder: (getRole) {
              if(getRole.userModel?.roleId ==1){
                 return BottomNavigationBar(
                backgroundColor: AppColor().mainColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                selectedFontSize: fontsize * 0.015,
                iconSize: fontsize * 0.0225,
                type: BottomNavigationBarType.fixed,
                currentIndex: getPage.currentPage,
                onTap: (index) {
                  getPage.setCurrentPage(index);
                },
                items: const  [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.important_devices, color: Colors.white),
                    label: 'ຂໍ້ມູນຫຼັກ',
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.white),
                    label: 'ຂໍ້ມູນສ່ວນຕົວ',
                  ),
                ],
              );
              }
              return BottomNavigationBar(
                backgroundColor: AppColor().mainColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                selectedFontSize: fontsize * 0.015,
                iconSize: fontsize * 0.0225,
                type: BottomNavigationBarType.fixed,
                currentIndex: getPage.currentPage,
                onTap: (index) {
                  getPage.setCurrentPage(index);
                },
                items: const  [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.white),
                    label: 'ໜ້າຫຼັກ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.white),
                    label: 'ຂໍ້ມູນສ່ວນຕົວ',
                  ),
                ],
              );
            }
          );
        }
        )
      );
  }
}
