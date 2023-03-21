// ignore_for_file: non_constant_identifier_names

import 'package:cit_academy_app/pages/admin/settings/position/position_add_page.dart';
import 'package:cit_academy_app/pages/admin/settings/user/user_add_page.dart';
import 'package:cit_academy_app/statemanagement/position_state.dart';
import 'package:cit_academy_app/statemanagement/user_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class UserPage extends StatefulWidget {
  const UserPage({super.key});
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
  }

  UserState userState = Get.put(UserState());
  @override
  void initState() {
    userState.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.yellow[50],
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
                  onChanged: (value) => {userState.searchData(value)},
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
              GetBuilder<UserState>(builder: (get) {
                if(get.check == false){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: get.searchuser.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(get.searchuser[index].id),
                          elevation: 4,
                          child: ListTile(
                            title: CustomWidget(
                                text: get.searchuser[index].firstname.toString() ??
                                    ""),
                            subtitle: CustomWidget(
                              text: get.searchuser[index].createdDate.toString(),
                              color: Colors.grey,
                            ),
                            trailing:  InkWell(
                              onTap: () => {
                                userState.showedit(get.searchuser[index]),
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserAddPage()))
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserAddPage()));
          },
        ));
  }
}
