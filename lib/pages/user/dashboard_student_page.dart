import 'dart:math';
import 'package:cit_academy_app/pages/user/detail_bill_page.dart';
import 'package:cit_academy_app/statemanagement/payment_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardStudentPage extends StatefulWidget {
  const DashboardStudentPage({Key? key}) : super(key: key);
  @override
  State<DashboardStudentPage> createState() => _DashboardStudentPageState();
}

class _DashboardStudentPageState extends State<DashboardStudentPage> {
  PaymentState paymentState = Get.put(PaymentState());
  var formatter = NumberFormat('#,###,000');
  @override
  void initState() {
    paymentState.getPayment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fixSize = size.width + size.height;
    return SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(
                height: size.height,
                child: GetBuilder<PaymentState>(
                  builder: (get) {
                    if(get.checkPayment == false){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(
                      itemCount: get.paymentList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailBillPage(bill: get.paymentList[index])))
                          },
                          child: Card(
                            elevation: 4,
                            child: ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.primaries[
                                        Random().nextInt(Colors.primaries.length)],
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: FittedBox(
                                        child: Text(
                                          '${get.paymentList[index].month.toString()}/${get.paymentList[index].year.toString()}',
                                          style: TextStyle(
                                              fontSize: fixSize * 0.012,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomWidget(
                                              text: formatter.format(get.paymentList[index].amount),
                                              color: Colors.green,
                                              fontSize: fixSize * 0.016,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomWidget(
                                              text: get.paymentList[index].des.toString(),
                                              fontSize: fixSize * 0.012,
                                            ),
                                            CustomWidget(
                                              text: 'ວັນທີ ${get.paymentList[index].createdAt.toString()}',
                                              fontSize: fixSize * 0.01,
                                             color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }
                ),
              ),
          ],
        ),
    );
  }
}
