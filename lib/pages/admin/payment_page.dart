// ignore_for_file: non_constant_identifier_names

import 'package:cit_academy_app/pages/admin/form_payment_page.dart';
import 'package:cit_academy_app/statemanagement/payment_state.dart';
import 'package:cit_academy_app/statemanagement/role_state.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../customs/app_color.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentState paymentState = Get.put(PaymentState());
  @override
  void initState() {
    paymentState.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    double h = size.height;
    double w = size.width;
    return Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
        title:  CustomWidget(
          text: 'ຊໍາລະຄ່າຮຽນ',fontSize: fontsize*0.02,
        ),
        backgroundColor: AppColor().mainColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: w,
                child: TextField(
                  onChanged: (value) => {
                    paymentState.searchData(value)
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
                child: GetBuilder<PaymentState>(
                  builder: (get) {
                    if(get.check == false){
                        return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        itemCount: get.searchdata.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FromPaymentPage(user: get.searchdata[index])));
                            },
                            child: Card(
                              elevation: 4,
                              child: ListTile(
                                title: CustomWidget(text:get.searchdata[index].firstname.toString() + get.searchdata[index].lastname.toString()),
                                subtitle: CustomWidget(text:get.searchdata[index].phone.toString(), color: Colors.grey,),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              ),
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
