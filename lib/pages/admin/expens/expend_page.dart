// ignore_for_file: non_constant_identifier_names

import 'package:cit_academy_app/pages/admin/admin_home_page.dart';
import 'package:cit_academy_app/pages/admin/expens/add_expen_page.dart';
import 'package:cit_academy_app/pages/admin/settings/position/position_add_page.dart';
import 'package:cit_academy_app/statemanagement/expense_state.dart';
import 'package:cit_academy_app/statemanagement/home_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../customs/app_color.dart';

class ExpenPage extends StatefulWidget {
  const ExpenPage({super.key});
  @override
  State<ExpenPage> createState() => _ExpenPageState();
}

class _ExpenPageState extends State<ExpenPage> {
  var formatter = NumberFormat("#,###,000");
  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
  }

  HomeState homeState = Get.put(HomeState());
  ExpenseState expenseState = Get.put(ExpenseState());
  @override
  void initState() {
    expenseState.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsize = width + height;
    return Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          title: CustomWidget(
            text: 'ຂໍ້ມູນລາຍຈ່າຍ',
            fontSize: fontsize * 0.016,
          ),
          backgroundColor: AppColor().mainColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: width,
                child: TextField(
                  onChanged: (value) => {expenseState.searchData(value)},
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'ຄົ້ນຫາ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      suffixIcon: const Icon(Icons.search)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<ExpenseState>(builder: (get) {
                if (get.check == false) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: get.searchdata.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(get.searchdata[index].id),
                          elevation: 4,
                          child: ListTile(
                            title: CustomWidget(
                              text:
                                  '${formatter.format(get.searchdata[index].amount)}₭',
                              fontWeight: FontWeight.bold,
                              color: AppColor().mainColor,
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomWidget(
                                  fontSize: fontsize * 0.011,
                                  text: get.searchdata[index].des.toString(),
                                  color: Colors.grey,
                                ),
                                CustomWidget(
                                  fontSize: fontsize * 0.01,
                                  text: getCustomFormattedDateTime(
                                    get.searchdata[index].createdAt.toString(),
                                    'dd/MM/yy hh:mm a',
                                  ),
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            trailing: InkWell(
                                onTap: () => {
                                      expenseState
                                          .showEdit(get.searchdata[index]),
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddExpenPage()))
                                    },
                                child: const Icon(Icons.edit)),
                          ),
                        );
                      }),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            expenseState.showmodel = null;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddExpenPage()));
          },
        ));
  }
}
