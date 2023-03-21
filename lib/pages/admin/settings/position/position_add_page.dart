import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/statemanagement/position_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:cit_academy_app/widgets/text_field_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionAddPage extends StatefulWidget {
  const PositionAddPage({super.key});

  @override
  State<PositionAddPage> createState() => _PositionAddPageState();
}

class _PositionAddPageState extends State<PositionAddPage> {
  PositionState positionState = Get.put(PositionState());
  TextEditingController name = TextEditingController();
  @override
  void initState() {
    name.text = positionState.showmodel?.name ?? "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsize = width + height;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: CustomWidget(
          text: 'ຂໍ້ມູນຕໍາແໜ່ງ',
          fontSize: fontsize * 0.016,
        ),
        backgroundColor: AppColor().mainColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(children: [
            TextFieldApp(
              controller: name,
              text: 'ຊື່ຕໍາແໜ້ງ',
              width: width,
              height: height * 0.06,
              borderRadius: 10.0,
              contentPadding: 10.0,
              elevation: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width*0.4,
                   height: height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                       positionState.showmodel = null;
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    ),
                    child: CustomWidget(
                      text: "ຍົກເລີກ",
                      fontSize: fontsize * 0.016,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GetBuilder<PositionState>(
                  builder: (get) {
                    if(get.showmodel !=null){
                      return SizedBox(
                       height: height * 0.06,
                       width: width*0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if(name.text.trim() == ""){
                            DiaLogApp().pleaseenteralltextDialog(context);
                            return;
                          }
                          positionState.updateData(context: context,id: get.showmodel?.id ?? 0, name: name.text);
                          name.text = "";
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                        child: CustomWidget(
                          text: "ແກ້ໄຂ",
                          fontSize: fontsize * 0.016,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                    }
                    return SizedBox(
                       height: height * 0.06,
                       width: width*0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if(name.text.trim() == ""){
                            DiaLogApp().pleaseenteralltextDialog(context);
                            return;
                          }
                          positionState.saveData(context: context, name: name.text);
                          name.text = "";
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                        child: CustomWidget(
                          text: "ບັນທຶກ",
                          fontSize: fontsize * 0.016,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
