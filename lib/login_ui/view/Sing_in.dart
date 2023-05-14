import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/Shared_preference.dart';
import '../modal/login_ui.dart';

class Sing_in extends StatefulWidget {
  const Sing_in({Key? key}) : super(key: key);

  @override
  State<Sing_in> createState() => _Sing_inState();
}

class _Sing_inState extends State<Sing_in> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 20.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            color: Color(0xff243abe),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(200))),
                      )
                    ],
                  ),
                  Stack(children: [Align(
                    alignment: Alignment(1.8, -0.6),
                    child: CircleAvatar(
                      radius: 20.w,
                      backgroundColor: Color(0xff243abe),
                    ),
                  ),
                    // Align(
                    //   alignment: Alignment(-5, -1.67),
                    //   child: CircleAvatar(
                    //     radius: 42.5.w,
                    //     backgroundColor: Color(0xff1F6AC7),
                    //   ),
                    // ),
                    Align(
                        alignment: Alignment(0, 0.4),
                        child: Image.asset(
                          "assets/login_image/Sign_up.png",
                          height: 300,
                          width: 300,
                        )),],),
                  Align(
                    alignment: Alignment(0, 0.10),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: textEmail,
                            decoration: InputDecoration(
                                hintText: "E-mail",

                                hintStyle: TextStyle(fontSize: 20),
                                suffixIcon: Icon(
                                  Icons.mail_outline_rounded,
                                  color: Color(0xff243abe),
                                )),
                          ),
                          TextField(
                            controller: textPassword,
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(fontSize: 20),
                                suffixIcon: Icon(
                                  Icons.lock_rounded,
                                  color: Color(0xff243abe),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          InkWell(
                            onTap: () async {
                              var Email = textEmail.text;
                              var Password = textPassword.text;
                              Shared_Praferece shared = Shared_Praferece();
                              Map m1 = await shared.readData();

                              if (Email == m1['g1'] && Password == m1['p1']) {
                                Navigator.pushNamed(context, 'welcome');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Invalid PassWord Or Email"),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 6.h,
                              width: 79.5.w,
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 6.5.w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Color(0xff243abe),
                                    Color(0xff0e66bd),
                                  ])),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'signup');
                      },
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )),
                  Align(
                    alignment: Alignment(0.9, 0.95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [SizedBox(height: 100 ),
                        Text(
                          "Dont't have account?",
                          style: TextStyle(fontSize: 5.w),
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 5.w,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
