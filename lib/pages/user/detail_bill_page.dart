
import 'package:cit_academy_app/models/payment_model.dart';
import 'package:cit_academy_app/statemanagement/date_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../customs/app_color.dart';
import '../../widgets/custom_widget.dart';
import '../../widgets/format_date.dart';

class DetailBillPage extends StatefulWidget {
  final PaymentModel bill;
  const DetailBillPage({super.key,required this.bill});

  @override
  State<DetailBillPage> createState() => _DetailBillPageState();
}

class _DetailBillPageState extends State<DetailBillPage> {
  var formatter = NumberFormat('#,###,000');
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        title:  CustomWidget(
          text: 'ລາຍລະອຽດໃບບິນ',fontSize: fontsize*0.02,
        ),
        backgroundColor: AppColor().mainColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                    children: [
                        Center(child: CustomWidget(text: ' ໃບບິນຊໍາລະຄ່າຮຽນ', fontSize: fontsize*0.02,)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomWidget(text: 'ເລກທີ: ${widget.bill.code}', fontSize: fontsize*0.01,),
                                CustomWidget(text: 'ຊໍາລະເດືອນ: ${widget.bill.month}/${widget.bill.year}', fontSize: fontsize*0.01,),
                              ],
                            ),
                             CustomWidget(text: 'ວັນທີ: ${widget.bill.createdAt}', fontSize: fontsize*0.01,),
                          ],
                        ),
                        const Divider(height: 2,),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidget(text: 'ຄໍາອະທິບາຍ:', fontSize: fontsize*0.01,),
                            CustomWidget(text: '${widget.bill.des}', fontSize: fontsize*0.01,),
                          ],
                        ),
                         Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidget(text: 'ຄ່າຮຽນ:', fontSize: fontsize*0.01,fontWeight: FontWeight.bold,),
                            CustomWidget(text: '${formatter.format(widget.bill.amount)} ກີບ', fontSize: fontsize*0.01,fontWeight: FontWeight.bold,),
                          ],
                        ),
                         Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomWidget(text: 'ໝາຍເຫດ:', fontSize: fontsize*0.01,),
                            CustomWidget(text: widget.bill.note !=null ?'${widget.bill.note}' : "", fontSize: fontsize*0.01,),
                          ],
                        ),
                     ],
          ),
        ),
      ),
    );
  }
}