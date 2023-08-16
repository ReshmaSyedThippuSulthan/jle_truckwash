import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage("assets/image/SplashScreen.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  height: 500,
                  width: 400,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(231, 246, 234, 238),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter your Email",
                          style: GoogleFonts.alegreyaSc(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: mailcontroller,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter your Password",
                          style: GoogleFonts.alegreyaSc(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: passwordcontroller,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ))),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Homescreen()));
                        },

                        child: SizedBox(
                          height: 50,
                          width: 80,
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.actor(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: 15,
                        // ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text(
                      //       "If you don't have a account?",
                      //       style: TextStyle(fontSize: 17),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: const Text(
                      //         "SignUp",
                      //         style: TextStyle(fontSize: 17),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
