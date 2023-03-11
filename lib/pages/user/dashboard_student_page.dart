import 'dart:math';
import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class DashboardStudentPage extends StatefulWidget {
  const DashboardStudentPage({Key? key}) : super(key: key);
  @override
  State<DashboardStudentPage> createState() => _DashboardStudentPageState();
}

class _DashboardStudentPageState extends State<DashboardStudentPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fixSize = size.width + size.height;
    return SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 1; i <= 10; i++)
              Card(
                elevation: 4,
                child: ListTile(
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        child: Text(
                          '${i + 1}',
                          style: TextStyle(
                              fontSize: fixSize * 0.012,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomWidget(
                                text: '1,500,000 ກີບ',
                                color: Colors.green,
                                fontSize: fixSize * 0.016,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomWidget(
                                text: 'ຊໍາລະຄ່າຮຽນ ເດືອນ 10/2023',
                                fontSize: fixSize * 0.012,
                              ),
                              CustomWidget(
                                text: 'ວັນທີ 02/01/2022 08:30 AM',
                                fontSize: fixSize * 0.01,
                               color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
    );
  }
}
