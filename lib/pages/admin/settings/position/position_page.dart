// ignore_for_file: non_constant_identifier_names

import 'package:cit_academy_app/pages/admin/settings/position/position_add_page.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class PositionPage extends StatefulWidget {
  const PositionPage({super.key});
  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {
  final List<Map<String, dynamic>> all_User = [
    {
      "id": 1,
      "name": "ຜູ້ບໍລິຫານ",
      "created_at": "5/03/2023 08:75 AM",
    },
    {
      "id": 2,
      "name": "ຜູ້ອໍານວຍການ",
      "created_at": "5/03/2023 08:75 AM",
    },
    {  
      "id": 3,
      "name": "ອາຈານ",
      "created_at": "5/03/2023 08:75 AM",
    },
  ];
  List<Map<String, dynamic>> find_User = [];
  @override
  void initState() {
    find_User = all_User;
    super.initState();
  }

  void runFind_User(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = all_User;
    } else {
      results = all_User
          .where((supplier) => supplier["UserName"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      find_User = results;
    });
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
                  onChanged: (value) => runFind_User(value),
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
                child: ListView.builder(
                    itemCount: find_User.length,
                    itemBuilder: (context, index) {
                      return Card(
                        key: ValueKey(all_User[index]["id"]),
                        elevation: 4,
                        child: ListTile(
                          title: CustomWidget(text:find_User[index]["name"]),
                          subtitle: CustomWidget(text:find_User[index]["created_at"], color: Colors.grey,),
                          trailing: const Icon(Icons.arrow_forward_ios,size: 20,),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
          floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const PositionAddPage()));
          },
        )
    );
  }
}
