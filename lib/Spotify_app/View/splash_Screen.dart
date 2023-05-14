// import 'package:flutter/material.dart';
//
// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   @override
//   State<Splash> createState() => _SplashState();
//
// }
//
// class _SplashState extends State<Splash> {@override
// @override
// void initState() {
//   super.initState();
//   Timer(Duration(seconds: 3),
//           ()=>Navigator.pushReplacement(context,
//           MaterialPageRoute(builder:
//               (context) =>
//               '/';
//           )
//       )
//   );
// }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Container(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Center(
//             child: Icon(
//               Icons.phone,
//               color: Colors.blue,
//               size: 80,
//             ),
//           ),
//           CircularProgressIndicator(),
//           Text(
//             "Made in India ✔🎶",
//             style: TextStyle(fontSize: 22),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
// //   @override
// //   Widget build(BuildContext context) {
// //     // return SafeArea(
// //     //   child: Scaffold(
// //     //     backgroundColor: Colors.black,
// //     //     body: Center(
// //     //       child: Column(
// //     //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //     //         children: [
// //     //           Image.asset(
// //     //             "Assets/Images/Spotify.png",
// //     //             width: 200,
// //     //             height: 200,
// //     //           ),
// //     //           CircularProgressIndicator(
// //     //             color: Colors.green,
// //     //           ),
// //     //         ],
// //     //       ),
// //     //     ),
// //     //   ),
// //     // );
// //   }
// // }
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('bottom');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/Spotify1.png",
                width: 250,
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}