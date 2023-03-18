import 'package:flutter/material.dart';
import '../utils/routes.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_app/Pages/Homepage.dart';
import 'package:notes_app/Pages/Loginpage.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 7),
      () {
        Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(
              builder: (context) => Loginpage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 39, 39, 39),
        // child: Image.asset("Images/logo1.jpg"),
        child: Center(
          child: Text(
            "Notes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
