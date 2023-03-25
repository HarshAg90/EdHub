import 'package:flutter/material.dart';
import '../utils/routes.dart';

class feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight + 2.0),
                child: Container(
                  child: SliverAppBar(
                    leading: Image.asset("Images/logo1.jpg"),
                    title: Text('Learn Log'),
                    titleTextStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    // centerTitle: true,
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      // dividerColor: Colors.black,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
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
                          text: "Favs",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            // SliverFillRemaining(
            //   child: TabBarView(
            //     children: [
            //       HomeTab(),
            //       SearchTab(),
            //       ProfileTab(),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
