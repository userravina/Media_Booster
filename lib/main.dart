import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_app/Spotify_app/Provider/Music_provider.dart';
import 'package:spotify_app/Spotify_app/View/Bottom_bar.dart';
import 'package:spotify_app/Spotify_app/View/First_Screen.dart';
import 'package:spotify_app/Spotify_app/View/Library_Screen.dart';
import 'package:spotify_app/Spotify_app/View/Music_Screen.dart';
import 'package:spotify_app/Spotify_app/View/splash_Screen.dart';
import 'package:spotify_app/Staggered_recycler_view/provider/Staggered_provider.dart';
import 'package:spotify_app/login_ui/view/Sing_in.dart';
import 'package:spotify_app/login_ui/view/Sing_up.dart';
import 'package:spotify_app/login_ui/view/Splash.dart';
import 'package:spotify_app/login_ui/view/login_home.dart';
import 'package:spotify_app/login_ui/view/welcome_Screen.dart';
import 'package:spotify_app/youtub_video/video_provider/video_provider.dart';
import 'package:spotify_app/youtub_video/view/Bottom_bar_video.dart';
import 'package:spotify_app/youtub_video/view/Home_Screen.dart';
import 'package:spotify_app/youtub_video/view/Splash_video.dart';
import 'package:spotify_app/youtub_video/view/Video_Screen.dart';

import 'Spotify_app/View/Search/search_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Music_provider(),
      ),
      ChangeNotifierProvider(create: (context) => SearchScreenProvider()),
       ChangeNotifierProvider(create: (context) => video_provider()),
      ChangeNotifierProvider(create: (context) => Staggered_provider()),
    ],
    child: Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
                 // initialRoute: 'Splash',
          debugShowCheckedModeBanner: false,
          routes: {
               // Spotifiy
            //   'music': (context) => Music_Screen(),
            // 'bottom': (context) => Bottom_bar(),
            // '/': (context) => First_Screen(),
            // 'Splash': (context) => Splash(),
            // 'library': (context) => Library(),

            // youtub
            //  '/': (context) => Home(),
            // 'Splash': (context) => video_splash(),
            // 'bottom': (context) => Bottom_video(),
            // 'video': (context) => Video_Screen(),

            //web view
            //  '/': (context) => Wed_Screen(),

            //staggered view

             // '/':(context) => Staggerred_view(),

            // login screen

             '/':(context) => Splash_login(),
            'login':(context) => Sing_in(),
            'signup':(context) => Login_1(),
            'welcome':(context) => login_home(),

            // all_in_app
            // '/':(context) => Home_Screen(),
            // 'app':(context) => App_Screen(),
          },
        );
      },
    ),
  ));
}
