// ignore_for_file: non_constant_identifier_names

import 'package:cit_academy_app/pages/admin/settings/position/position_add_page.dart';
import 'package:cit_academy_app/statemanagement/position_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class PositionPage extends StatefulWidget {
  const PositionPage({super.key});
  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {
  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
  }

  PositionState positionState = Get.put(PositionState());
  @override
  void initState() {
    positionState.getData();
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
                  onChanged: (value) => {positionState.searchData(value)},
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
              GetBuilder<PositionState>(builder: (get) {
                if(get.check == false){
                  return const Center(child: CircularProgressIndicator(),);
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
                                text: get.searchdata[index].name.toString() ??
                                    ""),
                            subtitle: CustomWidget(
                              text: getCustomFormattedDateTime(
                                  get.searchdata[index].createdAt.toString(),
                                  'dd/MM/yy hh:mm a'),
                              color: Colors.grey,
                            ),
                            trailing:  InkWell(
                              onTap: () => {
                                positionState.showEdit(get.searchdata[index]),
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PositionAddPage()))
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
            positionState.showmodel = null;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PositionAddPage()));
          },
        ));
  }
}
