import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_context/theme/color.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          title: Text(
            'My Wallet',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     Container(
              //         alignment: Alignment.topRight,
              //         padding: EdgeInsets.only(top: 60, right: 20),
              //         height: 200,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //             colors: [Color(0xFFFF6E02), Colors.blue],
              //             begin: Alignment.bottomLeft,
              //             end: Alignment.topLeft,
              //           ),
              //         ),
              //         child: Text(
              //           '0',
              //           style: GoogleFonts.roboto(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 18),
              //         )),
              //     Container(
              //         padding: EdgeInsets.only(top: 95, right: 10),
              //         alignment: Alignment.topRight,
              //         child: Text(
              //           'Wallet balance',
              //           style: GoogleFonts.roboto(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 16),
              //         )),
              //     Align(
              //       alignment: Alignment.topRight,
              //       child: Container(
              //           height: 30,
              //           width: 110,
              //           margin: EdgeInsets.only(
              //             top: 120,
              //             right: 10,
              //           ),
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //               border:
              //                   Border.all(width: 1, color: Color(0xFFCFCFCF))),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //               Icon(
              //                 Icons.add,
              //                 color: Colors.white,
              //               ),
              //               Text(
              //                 'Add Wallet',
              //                 style: GoogleFonts.roboto(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 14),
              //               ),
              //             ],
              //           )),
              //     ),
              //     Positioned(
              //         left: 40,
              //         bottom: -20,
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 40,
              //           width: 300,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: Colors.white,
              //               boxShadow: [
              //                 BoxShadow(blurRadius: 7.0, color: Colors.black)
              //               ]),
              //           child: Stack(
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   Text(
              //                     'My Cash',
              //                     style: GoogleFonts.roboto(
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                   Text('0',style: GoogleFonts.roboto(fontWeight: FontWeight.bold),)
              //                 ],
              //               ),
              //               SizedBox(height: 5,),
              //
              //             ],
              //           ),
              //         ))
              //   ],
              // )
              Container(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  'Add Money to',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ridhi Travels Wallet',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue[100],
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/wallet-filled-money-tool.png',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 20),
                child: Row(
                  children: [
                    Text(
                      'Available Balance :',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      '₹ 15000.00',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  'ADD MONEY TO YOUR WALLET',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    enabled: true,
                    decoration: InputDecoration(
                        hintText: ('1000 '), 
                        prefixIcon: Icon(Icons.currency_rupee,color: Colors.black,),
                        hintStyle: TextStyle(fontSize: 16,color: Colors.black)),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        height: 40,
                        width: 70,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                        child: const Text('₹100 '),
                      ),
                    ),
                    Card(
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        height: 40,
                        width: 70,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                        child: const Text('₹500 '),
                      ),
                    ),
                    Card(
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        height: 40,
                        width: 70,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                        child: const Text('₹1000 '),
                      ),
                    ),
                    Card(
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        height: 40,
                        width: 70,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                        child: const Text('₹2000 '),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Add Money',style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              )

            ],
          ),
        ),

    );
  }
}
