import 'package:flutter/material.dart';
import 'package:travel_context/theme/color.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
               height: 280,
                width: 280,
                child: Image.asset('assets/images/logo (1).png')),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: ('New Password'),
                  hintStyle: GoogleFonts.roboto(color: Colors.black),
                  contentPadding: EdgeInsets.only(top: 10, left: 20),
                  suffixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                  hintText: ('Confirm Password'),
                  hintStyle: GoogleFonts.roboto(color: Colors.black),
                  contentPadding: EdgeInsets.only(top: 10, left: 20),
                  suffixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(10)),
              child:TextButton(
                onPressed: () {
                 // Get.to(NarobototionPage());
                },
                child:  Text(
                  'SUBMIT',
                  style: GoogleFonts.roboto(
                      fontSize: 16, color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
