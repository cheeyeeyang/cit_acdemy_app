// ignore_for_file: non_constant_identifier_names
import 'package:cit_academy_app/models/get_user_model.dart';
import 'package:cit_academy_app/pages/admin/settings/user/user_add_page.dart';
import 'package:cit_academy_app/pages/admin/settings/user/user_edit.dart';
import 'package:cit_academy_app/statemanagement/user_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserState userState = Get.put(UserState());
  @override
  void initState() {
    userState.getData();
    super.initState();
  }

  void onSelected(BuildContext context, int item, GetUserModel model) {
    switch (item) {
      case 0:
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => Bill_PDF()),
        // );
        break;
      case 1:
       Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UserEditPage(user: model,)),
        );
        break;
      case 2:
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => Bill_Delete()),
        // );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsize = width + height;
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
              Expanded(
                child: GetBuilder<UserState>(builder: (get) {
                  if (get.check == false) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: get.searchuser.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(get.searchuser[index].id),
                          elevation: 4,
                          child: ListTile(
                            title: CustomWidget(
                                text: get.searchuser[index].firstname
                                        .toString() +
                                    get.searchuser[index].lastname.toString()),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomWidget(
                                  text: get.searchuser[index].phone.toString(),
                                  color: Colors.grey,
                                ),
                                CustomWidget(
                                  text:
                                      get.searchuser[index].address.toString(),
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            trailing: PopupMenuButton<int>(
                                onSelected: (item) => onSelected(
                                    context, item, get.searchuser[index]),
                                itemBuilder: (context) => [
                                      PopupMenuItem<int>(
                                          value: 0,
                                          child: Row(
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(Icons.person),
                                              ),
                                              Text("ລາຍລະອຽດ")
                                            ],
                                          )),
                                      PopupMenuItem<int>(
                                          value: 1,
                                          child: Row(
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(Icons.edit),
                                              ),
                                              Text("ແກ້ໄຂ")
                                            ],
                                          )),
                                      PopupMenuItem<int>(
                                          value: 2,
                                          child: Row(
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(Icons.delete),
                                              ),
                                              Text("ລຶບ")
                                            ],
                                          ))
                                    ]),
                          ),
                        );
                      });
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserAddPage()));
          },
        ));
  }
}
