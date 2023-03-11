

import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/detail_dialog.dart';
import 'package:flutter/material.dart';

class DiaLogApp{
  warningDialog(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return  DetailDialog(text: 'ມີບາງຢ່າງຜິດພາດກະລຸນາລອງອີກຄັ້ງ', icon: Icons.warning,iconcolor: AppColor().mainColor,);
        });
  }
  warningregisterDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return  DetailDialog(text: 'ກະລຸນາໃສ່ຂໍ້ມູນໃຫ້ຄົບ!',fontsize: fontsize*0.02, icon: Icons.warning,iconsize: fontsize*0.05, iconcolor: AppColor().mainColor,);
        });
  }
  responemessageDialog(BuildContext context, String message) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return  DetailDialog(text: message,fontsize: fontsize*0.02, icon: Icons.warning,iconsize: fontsize*0.05, iconcolor: AppColor().mainColor,);
        });
  }
  successDialog(BuildContext context, String message) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return  DetailDialog(text: message,fontsize: fontsize*0.02, icon: Icons.check_circle,iconsize: fontsize*0.05, iconcolor: Colors.green,);
        });
  }
   loginfailedDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = size.width + size.height;
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return  DetailDialog(text: 'ເບີໂທ ຫຼື ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ!',fontsize: fontsize*0.02, icon: Icons.warning,iconsize: fontsize*0.05, iconcolor: AppColor().mainColor,);
        });
  }
  circleprogressDialog(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return   AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const  [
                CustomWidget(text: 'ກະລຸນາລໍຖ້າ ...', color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w200,),
               SizedBox(
                  height: 10,
                ),
                 Center(child: CircularProgressIndicator(),)
              ],
            )
          );
        });
  }
}