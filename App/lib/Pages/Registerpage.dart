import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/Models/user_model.dart';
import 'package:notes_app/Pages/Homepage.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  bool changebutton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.black,
      ),
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
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30.0),
                      child: Column(
                        children: [
                          //Firstname field

                          TextFormField(
                            cursorColor: Colors.white,
                            controller: firstnamecontroller,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                              ),
                              prefixIconColor: Colors.white,
                              hintText: "First name",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Enter your First name",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First name cannot be empty";
                              }
                              // if (!RegExp(
                              //         "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              //     .hasMatch(value)) {
                              //   return ("Please enter valid first name");
                              // }

                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          //lastname field

                          TextFormField(
                            cursorColor: Colors.white,
                            controller: lastnamecontroller,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                              ),
                              prefixIconColor: Colors.white,
                              hintText: "Last name",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Enter your Last name",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last name cannot be empty";
                              }
                              // if (!RegExp(
                              //         "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              //     .hasMatch(value)) {
                              //   return ("Please enter valid last name");
                              // }

                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          //Email field
                          TextFormField(
                            cursorColor: Colors.white,
                            controller: emailcontroller,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              prefixIconColor: Colors.white,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Enter your Email",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter valid email address");
                              }

                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          //Password field
                          TextFormField(
                            obscureText: true,
                            controller: passwordcontroller,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.key),
                              prefixIconColor: Colors.white,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Enter Password",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
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
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          //Confirm password field
                          TextFormField(
                            obscureText: true,
                            controller: confirmpasswordcontroller,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.key),
                              prefixIconColor: Colors.white,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Confirm Your Password",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (confirmpasswordcontroller.text !=
                                  passwordcontroller.text) {
                                return "Password does not match";
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Material(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(changebutton ? 20 : 7),
                            // child: MaterialButton(onPressed: () {
                            //   signIn(emailcontroller.text, passwordcontroller.text);
                            // }),
                            child: InkWell(
                              onTap: () {
                                signUp(emailcontroller.text,
                                    passwordcontroller.text);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                //button
                                width: changebutton ? 60 : 110,
                                height: 40,
                                alignment: Alignment.center,

                                child: changebutton
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : const Text(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //SignUp method
  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
// http://127.0.0.1:5000/login

// {
  // "username": Usermodel.firstname,
  //  "email":"email"
// }
//Sending data to firestore database
  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstnamecontroller.text;
    userModel.lastname = lastnamecontroller.text;

    await firebaseFirestore
        .collection("Users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created Successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
          builder: (context) => const homepage(),
        ),
        (route) => false);
  }
}
