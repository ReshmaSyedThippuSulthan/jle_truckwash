import 'package:flutter/material.dart';
import 'package:uitask/loginscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      // code to be executed after 2 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
            image: NetworkImage(
                "https://freepngimg.com/thumb/wordpress_logo/3-2-wordpress-logo-png-pic.png")),
      ),
    );
  }
}
