import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/pages/admin/admin_setting_page.dart';
import 'package:cit_academy_app/pages/admin/expens/expend_page.dart';
import 'package:cit_academy_app/pages/admin/payment_page.dart';
import 'package:cit_academy_app/statemanagement/home_state.dart';
import 'package:cit_academy_app/statemanagement/user_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  var formatter = NumberFormat('#,###,000');
  UserState userState = Get.put(UserState());
  HomeState homeState = Get.put(HomeState());
  @override
  void initState() {
    userState.getstudentRegister();
    userState.getcountUser();
    homeState.getsumExpense();
    homeState.getsumIncome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsize = width + height;
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Dash_sale()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Icon(
                          Icons.notification_important,
                          size: fontsize * 0.07,
                          color: Colors.black87,
                        ),
                        GetBuilder<UserState>(builder: (get) {
                          if (get.checkRegister == false) {
                            return const SizedBox();
                          }
                          return CircleAvatar(
                            backgroundColor: AppColor().mainColor,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FittedBox(
                                  child: CustomWidget(
                                text: get.countRegister.toString() ?? "",
                                color: Colors.white,
                              )),
                            ),
                          );
                        })
                      ],
                    ),
                    Text('ລົງທະບຽນ',
                        style: TextStyle(fontSize: fontsize * 0.017))
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.account_balance_wallet_sharp,
                      size: fontsize * 0.07,
                      color: Colors.deepPurple,
                    ),
                    Text('ຊໍາລະຄ່າຮຽນ',
                        style: TextStyle(fontSize: fontsize * 0.017))
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Dash_notification()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Icon(
                          Icons.people,
                          size: fontsize * 0.07,
                          color: Colors.blue,
                        ),
                        GetBuilder<UserState>(builder: (get) {
                          if (get.checkcountUser == false) {
                            return const SizedBox();
                          }
                          return CircleAvatar(
                            backgroundColor: AppColor().mainColor,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FittedBox(
                                  child: CustomWidget(
                                text: get.countUser.toString() ?? "",
                                color: Colors.white,
                              )),
                            ),
                          );
                        })
                      ],
                    ),
                    Text('ຜູ້ໃຊ້ລະບົບ',
                        style: TextStyle(fontSize: fontsize * 0.017))
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminSettingPage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.settings,
                      size: fontsize * 0.07,
                      color: Colors.grey,
                    ),
                    Text('ຕັ້ງຄ່າລະບົບ',
                        style: TextStyle(fontSize: fontsize * 0.017))
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    size: fontsize * 0.07,
                    color: Colors.green[800],
                  ),
                  CustomWidget(
                    text: 'ລາຍຮັບ',
                    fontSize: fontsize * 0.012,
                    color: Colors.grey,
                  ),
                  GetBuilder<HomeState>(
                    builder: (get) {
                      if(get.checkIncome == false){
                        return const SizedBox();
                      }
                      return Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          CustomWidget(
                                text: '${formatter.format(get.sumincome)} ₭',
                                fontSize: fontsize * 0.014,
                                color: Colors.green),
                        ],
                      );
                    }
                  )
                
                ]
              ),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ExpenPage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: fontsize * 0.07,
                      color: Colors.red[800],
                    ),
                    CustomWidget(
                      text: 'ລາຍຈ່າຍ',
                      fontSize: fontsize * 0.012,
                      color: Colors.grey,
                    ),
                    GetBuilder<HomeState>(
                      builder: (get) {
                        if(get.checkExpense == false){
                          return const SizedBox();
                        }
                        return Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            CustomWidget(
                                text: '${formatter.format(get.sumexpense)} ₭',
                                fontSize: fontsize * 0.014,
                                color: Colors.red)
                          ],
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
