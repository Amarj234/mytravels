// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_context/screen/logged_page.dart';
import 'package:travel_context/screen/signup.dart';
import 'package:travel_context/theme/color.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          image: DecorationImage(
              image: AssetImage('assets/images/banner (1).jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25),
                  BlendMode.dstATop)
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.45,
                  child: Image.asset("assets/images/logo (1).png")),
              Container(
                height: MediaQuery.of(context).size.height*.01,
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 35,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Login With Facebook',
                        style: GoogleFonts.roboto(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Login With Google',
                      style: GoogleFonts.roboto(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                 Get.to(SignUpPage());
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                        size: 35,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Signup With Email',
                        style: GoogleFonts.roboto(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  'OR',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        " Already  have an account?",
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(LoggedPage());
                        },
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.roboto(
                              decoration: TextDecoration.underline,
                              color: background,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ))
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
