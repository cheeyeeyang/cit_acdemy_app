import 'dart:async';
import 'package:cit_academy_app/pages/poster_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
    bool isTapped = false;
    late int a;
  animation() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),(){
        animation();
        waiting();
    }
    );
    super.initState();
  }
 void waiting(){
    Timer(
        const Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const PosterPage())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          height: isTapped ? 250.0 : 150.0,
          width: isTapped ? 250 : 150.0,
          alignment:
              isTapped ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          margin: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 100.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('images/logo.png'), fit: BoxFit.cover),
          ),
        ),
      ),
      // body: Center(
      //   child: Image.asset('images/logo.png' ,width: 150,height: 150,),
      // ),
    );
  }
}
