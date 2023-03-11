import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/pages/login_page.dart';
import 'package:cit_academy_app/pages/register_page.dart';
import 'package:cit_academy_app/widgets/button_widget.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

class PosterPage extends StatefulWidget {
  const PosterPage({super.key});

  @override
  State<PosterPage> createState() => _PosterPageState();
}

class _PosterPageState extends State<PosterPage> {
  double scrollPosition = 0;
  double opacity = 0;
  _scrollListener() {
    setState(() {
      scrollPosition = _scrollController.position.pixels;
    });
  }

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double fontsize = width + heigth;
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(),
      child: Column(children: [
        Stack(
          children: [
            SizedBox(
                height: heigth * 1,
                width: width,
                child: Image.asset(
                  'images/yard.jpg',
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: heigth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CustomWidget(
                      textAlign: TextAlign.center,
                      text: 'ຍິນດີຕ້ອນຮັບເຂົ້າສູ່',
                      color: Colors.white,
                      fontSize: fontsize * 0.03,
                    ),
                  ),
                  Center(
                    child: CustomWidget(
                      textAlign: TextAlign.center,
                      text: 'CIT ACADEMY',
                      color: Colors.white,
                      fontSize: fontsize * 0.03,
                    ),
                  ),
                  GestureDetector(
                   onTap: () => {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage()))
                   },
                   child: ButtonWidget(
                     text: 'ລົງທະບຽນ',
                     width: width * 0.8,
                     height: ResponsiveWidget.isSmallScreen(context) ? heigth * 0.08 : heigth * 0.1,
                     borderRadius: 50.0,
                     backgroundcolor: AppColor().mainColor,
                     color: Colors.white,
                     fontSize: fontsize * 0.02,
                     boxshadowcolor: Colors.black45,
                   ),
                  ),
                  SizedBox(
                    height: heigth * 0.02,
                  ),
                    GestureDetector(
                   onTap: () => {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()))
                   },
                   child: ButtonWidget(
                     text: 'ເຂົ້າລະບົບ',
                     width: width * 0.8,
                     height: ResponsiveWidget.isSmallScreen(context) ? heigth *0.08 : heigth * 0.1,
                     borderRadius: 50.0,
                     backgroundcolor: Colors.white,
                     color: Colors.blue,
                     fontSize: fontsize * 0.02,
                      boxshadowcolor: Colors.black45,
                   ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
