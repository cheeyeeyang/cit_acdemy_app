import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/statemanagement/expense_state.dart';
import 'package:cit_academy_app/statemanagement/register_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/dialog_app.dart';
import 'package:cit_academy_app/widgets/text_field_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenPage extends StatefulWidget {
  const AddExpenPage({super.key});

  @override
  State<AddExpenPage> createState() => _AddExpenPageState();
}

class _AddExpenPageState extends State<AddExpenPage> {
  ExpenseState expenseState = Get.put(ExpenseState());
  RegisterState registerState = Get.put(RegisterState());
  TextEditingController amount = TextEditingController();
  TextEditingController des = TextEditingController();
  @override
  void initState() {
    amount.text = expenseState.showmodel?.amount.toString() ?? "";
    des.text = expenseState.showmodel?.des.toString() ?? "";
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
          text: 'ເພີ່ມລາຍຂ່າຍ',
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
        child: Form(
          child: Column(children: [
            TextFieldApp(
              controller: amount,
              text: 'ລາຍຈ່າຍ',
              width: width,
              height: height * 0.06,
              borderRadius: 10.0,
              contentPadding: 10.0,
              elevation: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldApp(
              controller: des,
              text: 'ລາຍລະອຽດ',
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
                  width: width * 0.4,
                  height: height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      expenseState.showmodel = null;
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
                GetBuilder<ExpenseState>(builder: (get) {
                  if (get.showmodel != null) {
                    return SizedBox(
                      height: height * 0.06,
                      width: width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if (amount.text.trim() == "" ||
                              des.text.trim() == "") {
                            DiaLogApp().pleaseenteralltextDialog(context);
                            return;
                          }
                          expenseState.updateData(
                              context: context,
                              id: get.showmodel?.id ?? 0,
                              amount: amount.text,
                              des: des.text);
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
                    width: width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        if (amount.text.trim() == "" || des.text.trim() == "") {
                          DiaLogApp().pleaseenteralltextDialog(context);
                          return;
                        }
                        expenseState.saveData(
                            context: context,
                            amount: amount.text,
                            des: des.text);
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
                }),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
