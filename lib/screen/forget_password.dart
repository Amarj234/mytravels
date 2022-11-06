import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:travel_context/screen/reset_password.dart';
import 'package:travel_context/theme/color.dart';
class ForgetPage extends StatelessWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: background,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 280,
                width: 280,
                child: Image.asset('assets/images/logo (1).png')),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0)),
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
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.fromLTRB(30,0, 30, 0),
              child: PinFieldAutoFill(
                codeLength: 6,
                decoration: UnderlineDecoration(
                    textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    colorBuilder: FixedColorBuilder(Colors.grey)
                ),



              ),
            ),


            SizedBox(height: 40,),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                 Get.to(ConfirmPage());
                },
                child: Text(
                  'SUBMIT',
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white,letterSpacing: 2),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


