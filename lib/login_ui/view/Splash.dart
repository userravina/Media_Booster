import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/Shared_preference.dart';
import '../modal/login_ui.dart';

class Splash_login extends StatefulWidget {
  const Splash_login({Key? key}) : super(key: key);

  @override
  State<Splash_login> createState() => _Splash_loginState();
}

class _Splash_loginState extends State<Splash_login> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() async {
      Shared_Praferece share=Shared_Praferece();
      Map l=await share.readData();
      l==true?Navigator.pushNamed(context, "welcome"):Navigator.pushNamed(context, "login");
    },);
    return Scaffold(
      backgroundColor: Color(0xff243abe),
      body: Center(
        child: Image.asset("assets/login_image/s1.png",
            fit: BoxFit.fill, height: 300, width: 300),
      ),
    );
  }
}