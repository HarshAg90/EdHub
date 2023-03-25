import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_app/Components/squaretile.dart';
import 'package:notes_app/Pages/Homepage.dart';
import 'package:notes_app/Pages/Registerpage.dart';
import 'package:notes_app/Services/auth_service.dart';
import '../utils/routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name =
      ""; //initialising an empty variable to override its value simultaneously when the user enter their username in the field.
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  get storage => null;

  MoveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    Image.asset(
                      "Images/logo_no_bg.png",
                      // alignment: Alignment.topLeft,
                      fit: BoxFit.cover,
                      height: 200.0,
                      // width: 200.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome you've been missed!",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30.0),
                      child: Column(
                        children: [
                          //Email field
                          TextFormField(
                            // cursorColor: Colors.white,
                            controller: emailcontroller,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              // prefixIcon: Icon(Icons.mail),
                              // iconColor: Colors.white,
                              hintText: "Email/Username",
                              hintStyle: TextStyle(color: Colors.grey),
                              // labelText: "Enter Email/Username",
                              // labelStyle: TextStyle(
                              //     color: Colors.black,
                              //     fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username cannot be empty";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                            // style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          //Password field
                          TextFormField(
                            obscureText: true,
                            controller: passwordcontroller,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              // prefixIcon: Icon(Icons.key),
                              iconColor: Colors.white,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              // labelText: "Enter Password",
                              // labelStyle: TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{6,}$');
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
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
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
                                signIn(emailcontroller.text,
                                    passwordcontroller.text);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(25),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                // duration: const Duration(seconds: 1),
                                //button
                                // width: changebutton ? 60 : 110,
                                // height: 40,
                                alignment: Alignment.center,

                                child: const Text(
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
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Google sign in button
                        ElevatedButton(
                          onPressed: () async {
                            // AuthService().signinwithgoogle();
                            GoogleSignInAccount? googleUser =
                                await _googleSignIn.signIn();

                            if (googleUser != null) {
                              // storeTokenandData(
                              //     UserCredential as UserCredential);
                              // Navigate to the homepage
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            // foregroundColor: Colors.transparent,
                          ),
                          child: SquareTile(imagePath: "Images/google.png"),
                        ),

                        //Github sign in button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: SquareTile(
                            imagePath: "Images/github.png",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const registerpage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Signup with email",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
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
                    MaterialPageRoute(builder: ((context) => const homepage())))
              })
          .catchError((error) {
        Fluttertoast.showToast(msg: error!.message);
      });
    }
  }

  // Future<void> storeTokenandData(UserCredential userCredential) async {
  //   await storage.write(
  //       key: "token", value: userCredential.credential!.token.toString());
  //   await storage.write(
  //       key: "usercredential", value: userCredential.toString());
  // }
}
