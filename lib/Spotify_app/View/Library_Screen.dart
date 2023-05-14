import 'package:flutter/material.dart';

import 'Music_Screen.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/31.jpg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Your Library",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 90),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Artists",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
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
                                      "${providerF!.name3[index].singname}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Artists",
                                      style: TextStyle(
                                          color: Colors.grey,),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            Icon(Icons.star_border_purple500_sharp,color: Colors.grey,),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.download_outlined,color: Colors.grey),
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
    );
  }
}
