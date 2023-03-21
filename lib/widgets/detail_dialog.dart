import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class DetailDialog extends StatelessWidget {
  const DetailDialog(
      {Key? key,
      required this.text,
      this.color,
      this.fontsize,
      required this.icon,
      this.iconsize,
      this.iconcolor,
      this.fontWeight,
      })
      : super(key: key);
  final String text;
  final Color? color;
  final double ? fontsize;
  final IconData icon;
  final double ? iconsize;
  final Color? iconcolor;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            content: Column(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Icon(icon, size: iconsize,color: iconcolor,),
                 const SizedBox(
                  height: 10,
                 ),
                 CustomWidget(text: text, fontSize: fontsize,color: color,fontWeight: fontWeight,),
                  const SizedBox(
                  height: 10,
                 ),
                 InkWell(
                  onTap: () => {
                    Navigator.pop(context)
                  },
                  child: ButtonWidget(text: 'OK', width: MediaQuery.of(context).size.width, height: 40,fontWeight: FontWeight.bold,fontSize: 20, color: Colors.white, borderRadius: 5.0,backgroundcolor: AppColor().mainColor,))
              ],
            ),
          );
  }
}
