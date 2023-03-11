import 'package:cit_academy_app/statemanagement/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_widget.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  var formatter = NumberFormat('#,###,000');
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<PaymentState>(
            builder: (get) {
              if(get.checkBill == false){
                  return const Center(child: CircularProgressIndicator(),);
              }
              return Column(
                    children: [
                        Center(child: CustomWidget(text: ' ໃບບິນຊໍາລະຄ່າຮຽນ', fontSize: fontsize*0.02,)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomWidget(text: 'ເລກທີ: ${get.billModel?.code}', fontSize: fontsize*0.01,),
                                CustomWidget(text: 'ຊໍາລະເດືອນ: ${get.billModel?.month}/${get.billModel?.year}', fontSize: fontsize*0.01,),
                              ],
                            ),
                             Column(
                              children: [
                                CustomWidget(text: 'ຊື່ ແລພ ນາມສະກຸນ: ${get.billModel?.firstname} ${get.billModel?.lastname}', fontSize: fontsize*0.01,),
                                CustomWidget(text: 'ເບີໂທ: ${get.billModel?.phone}', fontSize: fontsize*0.01,),
                              ],
                            )
                          ],
                        ),
                        const Divider(height: 2,),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidget(text: 'ຄໍາອະທິບາຍ:', fontSize: fontsize*0.01,),
                            CustomWidget(text: '${get.billModel?.des}', fontSize: fontsize*0.01,),
                          ],
                        ),
                         Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidget(text: 'ຄ່າຮຽນ:', fontSize: fontsize*0.01,fontWeight: FontWeight.bold,),
                            CustomWidget(text: '${formatter.format(get.billModel?.amount)} ກີບ', fontSize: fontsize*0.01,fontWeight: FontWeight.bold,),
                          ],
                        ),
                         Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidget(text: 'ໝາຍເຫດ:', fontSize: fontsize*0.01,),
                            CustomWidget(text: '${get.billModel?.note}', fontSize: fontsize*0.01,),
                          ],
                        ),
                     ],
              );
            }
          ),
        ),
      ),
    );
  }
}