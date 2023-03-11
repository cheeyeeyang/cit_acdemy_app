import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/text_field_app.dart';
import 'package:flutter/material.dart';

class PositionAddPage extends StatefulWidget {
  const PositionAddPage({super.key});

  @override
  State<PositionAddPage> createState() => _PositionAddPageState();
}

class _PositionAddPageState extends State<PositionAddPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsize = width + height;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title:  CustomWidget(
          text: 'ຂໍ້ມູນຕໍາແໜ່ງ',fontSize: fontsize*0.016,
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
            TextFieldApp(text: 'ຊື່ຕໍາແໜ້ງ', width: width, height: height*0.06, borderRadius: 10.0, contentPadding: 10.0,elevation: 4,),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: CustomWidget(text:"ຍົກເລີກ",  fontSize: fontsize*0.016,color: Colors.white,fontWeight: FontWeight.bold,),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: CustomWidget(text:"ບັນທຶກ", fontSize: fontsize*0.016,color: Colors.white,fontWeight: FontWeight.bold,),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
