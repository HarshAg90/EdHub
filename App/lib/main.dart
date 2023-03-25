import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Pages/Homepage.dart';
import 'package:notes_app/utils/routes.dart';
import 'package:notes_app/Pages/loginpage.dart';
import 'package:notes_app/Pages/Registerpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const notes());
}

class notes extends StatelessWidget {
  const notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // theme: ThemeData(
      //   fontFamily: GoogleFonts.lato().fontFamily,
      // ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => const homepage(),
        "/home": (context) => const homepage(),
        MyRoutes.homeRoute: (context) => const homepage(),
        // MyRoutes.splash: (context) => splash(),
        MyRoutes.loginRoute: (context) => Loginpage(),
        MyRoutes.registerRoute: (context) => const registerpage(),
      },
    );
  }
}
