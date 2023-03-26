import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class feed extends StatefulWidget {
  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  double _height1 = 170.0; // initial height of the container
  double _height2 = 170.0; // initial height of the container
  double _height3 = 170.0; // initial height of the container
  double _height4 = 170.0; // initial height of the container

  void _toggleHeight1() {
    setState(() {
      _height1 = _height1 == 170.0
          ? 300.0
          : 170.0; // toggle the height between 100 and 200
    });
  }

  void _toggleHeight2() {
    setState(() {
      _height2 = _height2 == 170.0
          ? 300.0
          : 170.0; // toggle the height between 100 and 200
    });
  }

  void _toggleHeight3() {
    setState(() {
      _height3 = _height3 == 170.0
          ? 300.0
          : 170.0; // toggle the height between 100 and 200
    });
  }

  void _toggleHeight4() {
    setState(() {
      _height4 = _height4 == 170.0
          ? 300.0
          : 170.0; // toggle the height between 100 and 200
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool isScrolled) {
                return [
                  SliverAppBar(
                    centerTitle: true,
                    leading: Image.asset(
                      "Images/logo_black.png",
                    ),
                    title: Text('Learn Log'),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    backgroundColor: Colors.white,
                    snap: true,
                    pinned: true,
                    floating: true,

                    bottom: TabBar(
                      labelStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      dividerColor: Colors.black,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.black),
                      tabs: [
                        // TextStyle(fontSize: 10),

                        Tab(
                          text: "Recommended",
                        ),
                        Tab(
                          text: "Latest",
                        ),
                        Tab(
                          // icon: Icons.favorite_border_rounded,
                          text: "Likes",
                        ),
                      ],
                    ),
                    elevation: 6,
                    // title: Text("Home"),
                    // centerTitle: true,
                    // floating: true,
                    // snap: true,
                  ),
                ];
              },
              body: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: _toggleHeight1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: Duration(milliseconds: 900),
                            // color: Colors.amberAccent,
                            alignment: Alignment.center,
                            height: _height1,
                            curve: Curves.easeInOutCubicEmphasized,
                            // width: 300,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 10, vertical: 20),
                                  // child:
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Container",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // ),
                                  Column(
                                    children: [
                                      Text("Feed description - "),
                                      Text("")
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: _toggleHeight2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: Duration(milliseconds: 900),
                            // color: Colors.amberAccent,
                            alignment: Alignment.center,
                            height: _height2,
                            curve: Curves.easeInOutCubicEmphasized,
                            // width: 300,
                            child: Text("Container"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: _toggleHeight3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: Duration(milliseconds: 900),
                            // color: Colors.amberAccent,
                            alignment: Alignment.center,
                            height: _height3,
                            curve: Curves.easeInOutCubicEmphasized,
                            // width: 300,
                            child: Text("Container"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: _toggleHeight4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: Duration(milliseconds: 900),
                            // color: Colors.amberAccent,
                            alignment: Alignment.center,
                            height: _height4,
                            curve: Curves.easeInOutCubicEmphasized,
                            // width: 300,
                            child: Text("Container"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // },
              ),
            )),
      ),
    );
  }
}
