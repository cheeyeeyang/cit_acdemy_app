
import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/pages/admin/settings/position/position_page.dart';
import 'package:cit_academy_app/pages/admin/settings/role_page.dart';
import 'package:cit_academy_app/pages/admin/settings/user/user_page.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class AdminSettingPage extends StatefulWidget {
  const AdminSettingPage({super.key});

  @override
  State<AdminSettingPage> createState() => _AdminSettingPageState();
}

class _AdminSettingPageState extends State<AdminSettingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsize = width + height;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
        title:  CustomWidget(
          text: 'ຂໍ້ມູນຫຼັກ',fontSize: fontsize*0.016,
        ),
        backgroundColor: AppColor().mainColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
          body: Column(
            children: [
              TabBar(tabs: [
                 Tab(
                  child: Text(
                    'ສິດນໍາໃຊ້',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
                Tab(
                  child: Text(
                    'ຜູ້ໃຊ້',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
                Tab(
                  child: Text(
                    'ຕໍາແໜ່ງ',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
              ]),
              Expanded(
                  child: TabBarView(
                children: [
                  Container(
                    color: Colors.blue[50],
                    child: const RolePage(),
                  ),
                  Container(
                    color: Colors.green[50],
                    child: const UserPage(),
                  ),
                  Container(
                    color: Colors.blue[50],
                    child: const PositionPage(),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
