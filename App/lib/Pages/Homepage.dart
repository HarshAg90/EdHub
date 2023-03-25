import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:notes_app/Screens/Favs.dart';
import 'package:notes_app/Screens/Feed.dart';
import 'package:notes_app/Screens/Profile.dart';
import '../Screens/Search.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _selectedindex = 0;
  final List<Widget> _widgetoptions = <Widget>[
    feed(),
    search(),
    favs(),
    profile()
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetoptions.elementAt(_selectedindex),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              gap: 10,
              tabBackgroundColor: Colors.grey.shade800,
              tabBorderRadius: 150,
              padding: const EdgeInsets.all(17),
              tabs: const [
                GButton(
                  //Feed button
                  icon: Icons.home_filled,
                  text: "Feed",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                  haptic: true,
                  // onPressed: Navigator.pop(feed()),
                  // () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => Loginpage(),
                  //       ));
                  // },
                ),
                GButton(
                  //Favs button
                  icon: Icons.add_box_rounded,
                  text: "Upload",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                  haptic: true,
                ),
                GButton(
                  //Search button
                  icon: Icons.search,
                  text: "Search",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                  haptic: true,
                ),
                GButton(
                  //Profile button
                  icon: Icons.person,
                  text: "Profile",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                  haptic: true,
                )
              ],
              selectedIndex: _selectedindex,
              onTabChange: _onItemTap,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        // body: ,
      ),
    );
  }
}
