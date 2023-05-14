import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Music_Screen.dart';

class Bottom_bar extends StatefulWidget {
  const Bottom_bar({Key? key}) : super(key: key);

  @override
  State<Bottom_bar> createState() => _Bottom_barState();
}

class _Bottom_barState extends State<Bottom_bar> {
  @override
  Widget build(BuildContext context) {
    providerF = Provider.of(context, listen: false);
    providerT = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: providerF!.Screens[providerT!.i],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: providerT!.i,
          onTap: (value) {
            providerF!.change(value);
          },
          mouseCursor: MouseCursor.uncontrolled,
          elevation: 0,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.white),
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black87,
          items: [
            BottomNavigationBarItem(
              label: "Games",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "your Library",
              icon: Icon(Icons.subscriptions),
            ),
          ],
        ),
      ),
    );
  }
}
