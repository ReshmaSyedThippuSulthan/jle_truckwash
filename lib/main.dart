import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uitask/splashscreen.dart';

import 'homescreen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),
  ));
}

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController mailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//     );
//   }
// }
