import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_context/navigation_page.dart';
import 'package:travel_context/screen/forget_password.dart';
import 'package:travel_context/theme/color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class LoggedPage extends StatelessWidget {
  const LoggedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/banner (1).jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.orange.withOpacity(0.25), BlendMode.dstATop),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 10,),
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "Join the club of most Trusted happy Traveller's",
                        style: GoogleFonts.lora(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize:20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "Join To innovate new Destinations",
                        style: GoogleFonts.lora(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize:20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "Join to Pay less and Get best services",
                        style: GoogleFonts.lora(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    )
                  ],
                  onPageChanged: (value) {
                    //print('Page changed: $value');
                  },
                  autoPlayInterval: 3000,
                  isLoop: true,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .15,
              ),
              Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.topLeft,
                child: Text(
                  'Login',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: ('Email Address'),
                    hintStyle: GoogleFonts.roboto(color: Colors.black),
                    contentPadding: EdgeInsets.only(top: 10, left: 20),
                    suffixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: ('Password'),
                    hintStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.only(top: 10, left: 20),
                    suffixIcon: const Icon(
                      Icons.key_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: background, borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    Get.to(NarobototionPage());
                  },
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Colors.white, letterSpacing: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Get.to(ForgetPage());
                    },
                    child: Text(
                      'Forget Password',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
