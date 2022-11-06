import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel_context/screen/Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigethome();
  }

  _navigethome() async {
    await Future.delayed(const Duration(seconds:4), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
       height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/logo (1).png'),

        ),
    )
      )

    );
  }
}
