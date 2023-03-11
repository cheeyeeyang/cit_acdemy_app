// ignore_for_file: non_constant_identifier_names

import 'package:cit_academy_app/statemanagement/role_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});
  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  RoleState roleState = Get.put(RoleState());
  @override
  void initState() {
    roleState.getData();
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
                  onChanged: (value) => {
                    roleState.searchData(value)
                  },
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
                child: GetBuilder<RoleState>(
                  builder: (get) {
                    if(get.check == false){
                        return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        itemCount: get.searchroles.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            child: ListTile(
                              title: CustomWidget(text:get.searchroles[index].name.toString()),
                              subtitle: CustomWidget(text:get.searchroles[index].createdAt.toString(), color: Colors.grey,),
                            ),
                          );
                        });
                  }
                ),
              ),
            ],
          ),
        ),
    );
  }
}
