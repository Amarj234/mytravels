import 'package:flutter/material.dart';
import '/flight/booking_details.dart';
import '/theme/color.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FlightBooking extends StatefulWidget {
   FlightBooking({Key? key, required  this.single}) : super(key: key);
final List single;

  @override
  State<FlightBooking> createState() => _FlightBookingState();
}

class _FlightBookingState extends State<FlightBooking> {
 // List alldata=[];
  List mydata=[];
  List apidata=[];
  List alldata=[];
  initState(){
    super.initState();
    alldata =widget.single;
    mydata.add(alldata[0]['mydata']);
    apidata.add(alldata[0]['apidata']);
   // print(mydata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'Flights Details',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "${mydata[0]['origin']} - ${mydata[0]['destination']}",
                  style: GoogleFonts.roboto(

                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                    DateFormat.yMMMd().format(DateFormat("yyyy-MM-dd").parse(mydata[0]['departDate'].toString())).toString(),
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 20,
                    ),
                    Text(
                      '${mydata[0]['NoOfAdutls']} Adult',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                apidata[0]['Segments'][0][0]['Origin']['Airport']['CityName'].toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                apidata[0]['Segments'][0][0]['Origin']['DepTime'].split("T")[1].toString(),
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                DateFormat.yMMMd().format(DateFormat("yyyy-MM-dd").parse(mydata[0]['departDate'].toString())).toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 2,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(
                            //     left: 20,
                            //   ),
                            //   child: Text(
                            //     '(T3), Indra',
                            //     style: GoogleFonts.roboto(
                            //       color: Colors.black,
                            //       fontSize: 16,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                apidata[0]['Segments'][0][0]['Origin']['Airport']['AirportName'].toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                apidata[0]['Segments'][0][0]['Destination']['Airport']['CityName'].toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                apidata[0]['Segments'][0][0]['Destination']['ArrTime'].split("T")[1].toString(),
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                DateFormat.yMMMd().format(DateFormat("yyyy-MM-dd").parse(mydata[0]['departDate'].toString())).toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 2,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(
                            //     left: 20,
                            //   ),
                            //   child: Text(
                            //     '(T2) Chhatrapati Shivaji',
                            //     style: GoogleFonts.roboto(
                            //       color: Colors.black,
                            //       fontSize: 16,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                apidata[0]['Segments'][0][0]['Destination']['Airport']['AirportName'].toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Baggage Allowance',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Delhi - Mumbai',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(

                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 40,

                          color: Colors.red[300],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'PASSENGER',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'CABINE',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'CHECK-IN',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'ADULT',
                                style: GoogleFonts.roboto(),
                              ),
                              Column(
                                children: [
                                  Text(
                                    apidata[0]['Segments'][0][0]['CabinBaggage'].toString(),
                                    style: GoogleFonts.roboto(),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    '1 Piece',
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    apidata[0]['Segments'][0][0]['Baggage'].toString(),
                                    style: GoogleFonts.roboto(),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    '1 Piece',
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 40,
                    color: Colors.red[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Extra Baggage Charge Rs 500/Kg',
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 80),
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      Get.to(BookingDetails(alldata:alldata));
                    },
                    child: Text(
                      'BOOk NOW',
                      style: GoogleFonts.roboto(
                          fontSize: 16, color: Colors.white, letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
