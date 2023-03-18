// import 'dart:js';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/Pages/Homepage.dart';
import 'package:notes_app/Pages/Registerpage.dart';
import '../utils/routes.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name =
      ""; //initialising an empy variable to override its value simultaneously when the user enter their username in the field.
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  final _auth = FirebaseAuth.instance;
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 39, 39, 39),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 150.0,
                ),
                Image.asset(
                  "Images/logo1.jpg",
                  // alignment: Alignment.topLeft,
                  fit: BoxFit.cover,
                  height: 200.0,
                  // width: 200.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      //Email field
                      TextFormField(
                        cursorColor: Colors.white,
                        controller: emailcontroller,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          iconColor: Colors.white,
                          hintText: "Email/Username",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Enter Email/Username",
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter valid email address");
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //here i'm changing the state of the username textformfield which then will show next to the "Welcome" text.
                          name = value;
                          setState(() {});
                        },
                        style: TextStyle(color: Colors.white),
                      ),

                      //Password field
                      TextFormField(
                        obscureText: true,
                        controller: passwordcontroller,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          iconColor: Colors.white,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Enter Password",
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          // if (value.length < 5) {
                          //   return "Password length should be greater than 5";
                          // }
                          if (!regex.hasMatch(value)) {
                            return ("Enter a valid password (min. 5 char)");
                          }

                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(
                      //       backgroundColor: Color.fromARGB(255, 116, 49, 204),
                      //       minimumSize: Size(100, 40)),
                      // ),
                      Material(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 20 : 7),
                        // child: MaterialButton(onPressed: () {
                        //   signIn(emailcontroller.text, passwordcontroller.text);
                        // }),
                        child: InkWell(
                          onTap: () {
                            signIn(
                                emailcontroller.text, passwordcontroller.text);
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            //button
                            width: changebutton ? 60 : 110,
                            height: 40,
                            alignment: Alignment.center,

                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => registerpage(),
                          ),
                        );
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//Login function
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(
              email: emailcontroller.text.toString().trim(), password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful!"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => homepage())))
              })
          .catchError((error) {
        Fluttertoast.showToast(msg: error!.message);
      });
    }
  }
}
