import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<String> fetchData() async {
//   var url = await Uri.parse('http://192.168.1.7/letest_feeds');
//   var response = await http.get(url);
//   var data = jsonDecode(response.body);
//   String title = data["1"]["content"]["heading"];
//   // print("Response: ${response.body}");
//   if (response.statusCode == 200) {
//     return response.body;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

class feed extends StatefulWidget {
  const feed({super.key});

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  bool isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  String desc = '';
  String title = '';

  String desc1 = '';
  String title1 = '';

  String desc2 = '';
  String title2 = '';

  String desc3 = '';
  String title3 = '';

  String desc4 = '';
  String title4 = '';

  double _height1 = 170.0; // initial height of the container
  double _height2 = 170.0; // initial height of the container
  double _height3 = 170.0; // initial height of the container
  double _height4 = 170.0; // initial height of the container

  Future<dynamic> fetchData() async {
    var url = Uri.parse('http://172.16.6.205/letest_feeds');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    // var data = jsonEncode(http.get(url));

    // String desc = data["1"]["content"]["heading"];
    // print("Response: ${response.body}");
    if (response.statusCode == 200) {
      setState(() {
        desc = data["1"]["content"]["body"];
        title = data["1"]["content"]["heading"];

        desc1 = data["2"]["content"]["body"];
        title1 = data["2"]["content"]["heading"];

        desc2 = data["3"]["content"]["body"];
        title2 = data["3"]["content"]["heading"];

        desc3 = data["4"]["content"]["body"];
        title3 = data["4"]["content"]["heading"];

        desc4 = data["5"]["content"]["body"];
        title4 = data["5"]["content"]["heading"];
      });
      // return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _toggleHeight1() {
    setState(() {
      _height1 = _height1 == 170.0
          ? 170.0
          : 300.0; // toggle the height between 100 and 200
    });
  }

  void _toggleHeight2() {
    setState(() {
      _height2 = _height2 == 170.0 ? 170.0 : 300.0;
      ; // toggle the height between 100 and 200
    });
  }

  void _toggleHeight3() {
    setState(() {
      _height3 = _height3 == 170.0
          ? 170.0
          : 300.0; // toggle the height between 100 and 200
    });
  }

  void _toggleHeight4() {
    setState(() {
      _height4 = _height4 == 170.0
          ? 170.0
          : 300.0; // toggle the height between 100 and 200
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // debugShowCheckedModeBanner: false,
      child: Scaffold(
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
                    title: const Text('Learn Log'),
                    titleTextStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    backgroundColor: Colors.white,
                    snap: true,
                    pinned: true,
                    floating: true,

                    bottom: TabBar(
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      dividerColor: Colors.black,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black),
                      tabs: const [
                        // TextStyle(fontSize: 10),

                        Tab(
                          text: "Feed",
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
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isExpanded = !isExpanded;
                            },
                          );
                        },
                        // _toggleHeight1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 215, 227, 255),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                duration: const Duration(milliseconds: 900),
                                // color: Colors.amberAccent,
                                alignment: Alignment.center,
                                // height: _height1,
                                height: isExpanded ? 240 : 350,
                                curve: Curves.easeInOutCubicEmphasized,
                                // width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 20),
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
                                              "$title",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            child: Flex(
                                              direction: Axis.horizontal,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "$desc",
                                                    maxLines:
                                                        isExpanded ? 6 : 100,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isExpanded1 = !isExpanded1;
                            },
                          );
                        },
                        // _toggleHeight1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 218, 230),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                duration: const Duration(milliseconds: 900),
                                // color: Colors.amberAccent,
                                alignment: Alignment.center,
                                // height: _height1,
                                height: isExpanded1 ? 240 : 350,
                                curve: Curves.easeInOutCubicEmphasized,
                                // width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 20),
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
                                              "$title1",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            child: Flex(
                                              direction: Axis.horizontal,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "$desc1",
                                                    maxLines:
                                                        isExpanded1 ? 6 : 100,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: _toggleHeight2,
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 30, vertical: 10),
                      //     child: AnimatedContainer(
                      //       decoration: BoxDecoration(
                      //         color: Colors.blueAccent.shade100,
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       duration: Duration(milliseconds: 900),
                      //       // color: Colors.amberAccent,
                      //       alignment: Alignment.center,
                      //       height: _height2,
                      //       curve: Curves.easeInOutCubicEmphasized,
                      //       // width: 300,
                      //       child: Text("Container"),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isExpanded2 = !isExpanded2;
                            },
                          );
                        },
                        // _toggleHeight1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 239, 255, 221),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                duration: const Duration(milliseconds: 900),
                                // color: Colors.amberAccent,
                                alignment: Alignment.center,
                                // height: _height1,
                                height: isExpanded2 ? 240 : 350,
                                curve: Curves.easeInOutCubicEmphasized,
                                // width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 20),
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
                                              "$title2",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            child: Flex(
                                              direction: Axis.horizontal,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "$desc2",
                                                    maxLines:
                                                        isExpanded2 ? 6 : 100,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isExpanded3 = !isExpanded3;
                            },
                          );
                        },
                        // _toggleHeight1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 255, 233),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: const Duration(milliseconds: 900),
                            // color: Colors.amberAccent,
                            alignment: Alignment.center,
                            // height: _height1,
                            height: isExpanded3 ? 240 : 350,
                            curve: Curves.easeInOutCubicEmphasized,
                            // width: 300,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 20),
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
                                          "$title3",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            child: Expanded(
                                              child: Text(
                                                "$desc3",
                                                maxLines: isExpanded3 ? 6 : 100,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isExpanded4 = !isExpanded4;
                            },
                          );
                        },
                        // _toggleHeight1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 250, 191),
                              borderRadius: BorderRadius.circular(20),
                            ),

                            duration: const Duration(milliseconds: 900),
                            // color: Colors.amberAccent,
                            alignment: Alignment.center,
                            // height: _height1,
                            height: isExpanded4 ? 200 : 350,
                            curve: Curves.easeInOutCubicEmphasized,
                            // width: 300,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 20),
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
                                          "$title3",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            child: Expanded(
                                              child: Text(
                                                "$desc3",
                                                maxLines: isExpanded4 ? 6 : 100,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
