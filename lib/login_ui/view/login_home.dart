import 'package:flutter/material.dart';

class login_home extends StatefulWidget {
  const login_home({Key? key}) : super(key: key);

  @override
  State<login_home> createState() => _login_homeState();
}

class _login_homeState extends State<login_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(
             padding: const EdgeInsets.all(10),
             child: Image.asset("assets/login_image/w.png"),
           ),
          ],
        ),
      ),
    );
  }
}