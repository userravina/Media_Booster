import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_app/Spotify_app/View/Music_Screen.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Text(
                  "Good Evening",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.notifications, color: Colors.white),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.access_alarm, color: Colors.white),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        image: DecorationImage(
                            alignment: Alignment.topLeft,
                            image: AssetImage("assets/images/arman1.jpeg"))),
                    child: Row(children: [
                      SizedBox(
                        width: 70,
                      ),
                      Text(
                        "Hindi Mix..",
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        image: DecorationImage(
                            alignment: Alignment.topLeft,
                            image: AssetImage("assets/images/arman2.jpeg"))),
                    child: Row(children: [
                      SizedBox(
                        width: 70,
                      ),
                      Text(
                        "Main \nRahoon y..",
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Text(
                    "Your top mixes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  height: 30.h,
                  width: 94.w,
                  child: CarouselSlider.builder(
                    itemCount: providerT!.imageslider.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        height: 30.h,
                        width: 94.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                    "${providerF!.imageslider[index]}"),
                                fit: BoxFit.fill)),
                      );
                    },
                    options: CarouselOptions(
                      height: 350.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      onPageChanged: (index, reason) {
                        providerT!.changeslider(index);
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: providerF!.imageslider
            //       .asMap()
            //       .entries
            //       .map(
            //         (e) => Container(
            //             margin: EdgeInsets.all(5),
            //             height: 1.h,
            //             width: 1.h,
            //             decoration: BoxDecoration(
            //                 color: providerT!.sliderindex == e.key
            //                     ? Colors.red
            //                     : Colors.grey,
            //                 shape: BoxShape.circle)),
            //       )
            //       .toList(),
            // ),
            SizedBox(
              height: 182,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        providerF!.cleack = index;
                        Navigator.pushNamed(context, 'music', arguments: index);
                        // Navigator.pushNamed(context, "music", arguments: index);
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          Container(
                            height: 100,
                            width: 170,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "${providerF!.name[index].img}"),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 50,
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${providerF!.name[index].singname}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${providerF!.name[index].songname}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: providerT!.name.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    "Charts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 182,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        providerT!.cleack = index + 4;
                        Navigator.pushNamed(context, "music", arguments: index);
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          Container(
                            height: 100,
                            width: 170,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "${providerF!.name[index + 4].img}"),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 50,
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${providerF!.name[index + 4].singname}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${providerF!.name[index + 4].songname}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 4,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 500,
              width: 350,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${providerF!.name3[index].img}"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 84,
                                width: 200,
                                child: Column(children: [
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "${providerF!.name3[index].songname}",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "${providerF!.name3[index].singname}",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Icon(
                                Icons.star_border_purple500_sharp,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.download_outlined, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
                itemCount: providerF!.name3.length,
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
