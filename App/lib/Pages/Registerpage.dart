import 'package:flutter/material.dart';
import '../utils/routes.dart';
import 'package:notes_app/main.dart';
import 'loginpage.dart';

class registerpage extends StatelessWidget {
  const registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          backgroundColor: Color.fromARGB(255, 39, 39, 39),
        ),
        body: Text("Hello register page"),
      ),
    );
  }
}
