import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_context/bottomclipper.dart';
import 'package:travel_context/theme/color.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                  clipper: Customshape(),
                  child: Container(
                    // width: size.width,
                    height: 250,
                    decoration: const BoxDecoration(color: background),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 43,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                             AssetImage('assets/images/tom.jpg'),
                            child: Positioned(
                              child: IconButton(onPressed: (){}, icon:Icon(Icons.edit,size: 30,)),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Hi, Karan',
                        style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('First Name',style: GoogleFonts.roboto(color: Colors.blue),),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter First Name',
                  suffixIcon: InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(

                          actions: <Widget>[
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: TextFormField(

                                    decoration: InputDecoration(

                                      hintText: ('First Name'),
                                      hintStyle: GoogleFonts.roboto(color: Colors.black),


                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10)
                                    ),

                                    child:  Text("Submit",style: GoogleFonts.roboto(color: Colors.white),),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                      child: Icon(Icons.edit)),
                  hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey)
               
                ),

              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('Last Name',style: GoogleFonts.roboto(color: Colors.blue),),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                    hintText: 'Enter Last Name',
                    suffixIcon: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(

                              actions: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TextFormField(

                                        decoration: InputDecoration(

                                          hintText: ('Last Name'),
                                          hintStyle: GoogleFonts.roboto(color: Colors.black),


                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                        child:  Text("Submit",style: GoogleFonts.roboto(color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          );
                        },
                        child: Icon(Icons.edit)),
                    hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey)
                ),

              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('Mobile Number',style: GoogleFonts.roboto(color: Colors.blue),),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter Last Name',
                    suffixIcon: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(

                              actions: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TextFormField(

                                        decoration: InputDecoration(

                                          hintText: ('Mobile Number'),
                                          hintStyle: GoogleFonts.roboto(color: Colors.black),


                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                        child:  Text("Submit",style: GoogleFonts.roboto(color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          );
                        },
                        child: Icon(Icons.edit)),
                    hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey)
                ),

              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('Email',style: GoogleFonts.roboto(color: Colors.blue),),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'rssinfotech@gmail.com',
                    suffixIcon: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(

                              actions: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TextFormField(

                                        decoration: InputDecoration(

                                          hintText: ('Email'),
                                          hintStyle: GoogleFonts.roboto(color: Colors.black),


                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                        child:  Text("Submit",style: GoogleFonts.roboto(color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          );
                        },
                        child: Icon(Icons.edit)),
                    hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('Password',style: GoogleFonts.roboto(color: Colors.blue),),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'password',
                    suffixIcon: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(

                              actions: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TextFormField(

                                        decoration: InputDecoration(

                                          hintText: ('Password'),
                                          hintStyle: GoogleFonts.roboto(color: Colors.black),


                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                        child:  Text("Submit",style: GoogleFonts.roboto(color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          );
                        },
                        child: Icon(Icons.edit)),
                    hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('Address',style: GoogleFonts.roboto(color: Colors.blue),),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Address',
                    suffixIcon: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(

                              actions: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TextFormField(

                                        decoration: InputDecoration(

                                          hintText: ('Address'),
                                          hintStyle: GoogleFonts.roboto(color: Colors.black),


                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                        child:  Text("Submit",style: GoogleFonts.roboto(color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          );
                        },
                        child: Icon(Icons.edit)),
                    hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey)
                ),

              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: background, borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                    },
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.roboto(
                          fontSize: 16, color: Colors.white,),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
