import 'dart:convert';

import 'package:flutter/material.dart';
import '/flight/flight_booking.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class FlightSearch extends StatefulWidget {
  const FlightSearch({Key? key, required List this.alldata}) : super(key: key);
final List alldata;

  @override
  State<FlightSearch> createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch> {
initState(){
  super.initState();
  getPlaces();
}
List dataf=[];

String? from;
String? to;



var data;  getPlaces() async {

  widget.alldata.forEach((element) {
    from=element['fromcityname'];
    to=element['tocityname'];

     data = {
      'tripType': "1",
      'origin': element['fromcity'],
      'destination': element['tocity'],
      'NoOfAdutls': element['adult'],
      'departDate':element['date'],
      'return_date': element['date'],
       "cabinclass":element['cabinclass'],
      'NoOfChild': element['child'],
      'NoOfInfant': element['infant'],
    };

  });

print(data);

    Uri myUri = Uri.parse('https://ridhitravels.in/app/api/search-flight.php');
    final response = await http.post(myUri,body: data,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        });


    // body: data,

    if (response.statusCode == 200) {
      var   re = jsonDecode(response.body);

        setState(() {


          dataf = re['Response']['Results'][0];
        });

     // print(response.body);
      print(dataf);

    }
    setState(() {
      loadImage = false;
    });
  }
bool loadImage =true;
List search=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCFCFCF),
   
      body: loadImage?Center(child: CircularProgressIndicator()):dataf.length==0? Center(child: Text("Data not Found"),) : SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Card(
                child: Container(
                  height: 60,
                  width: 400,
                  color: Color(0xFFf2f2f2),
                  child: ListTile(

                    leading: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/curve.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "${from} to ${to} ",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    // trailing: Icon(
                    //   Icons.more_horiz,
                    //   color: Colors.black,
                    // ),
                  ),
                ),
              ),
            ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: dataf.map((row) {
                //print( 'https://tbolite.tektravels.com/Images/Air/AirlineLogo_25x25/${row['FareRules']['AirlineCode']}.gif');
                return   InkWell(
                  onTap: () {
                    var arr={

                      'mydata': data,
                      'apidata':row,

                    };
                    search.add(arr);
                    Get.to(FlightBooking(single:search));
                  },
                  child:  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage('assets/images/flight.jpg'),
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.dstATop))),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10, top: 5, right: 30),
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      // Text(
                                      //   'Flight No.',
                                      //   style: GoogleFonts.roboto(
                                      //       color: Colors.black,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      // SizedBox(
                                      //   width: 5,
                                      // ),
                                      Text(
                                        "${row['Segments'][0][0]['Airline']['AirlineCode']} -${row['Segments'][0][0]['Airline']['FlightNumber']}",
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.network(
                                  'https://tbolite.tektravels.com/Images/Air/AirlineLogo_25x25/${row['FareRules'][0]['Airline']}.gif',
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/right.png',
                                  height: 30,
                                  width: 30,
                                ),
                                Text(
                                  "${row['Segments'][0][0]['Airline']['AirlineName']}",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FROM',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      row['Segments'][0][0]['Origin']['DepTime'].split("T")[1].toString(),
                                      style: GoogleFonts.roboto(),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      row['Segments'][0][0]['Origin']['Airport']['CityName'].toString(),
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text(
                                      'TO',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      row['Segments'][0][0]['Destination']['ArrTime'].split("T")[1].toString(),
                                      style: GoogleFonts.roboto(),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      row['Segments'][0][0]['Destination']['Airport']['CityName'].toString(),
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text(
                                      'DURATION',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${Duration( minutes: row['Segments'][0][0]['Duration']).toString().split(
                                      ':')[0]}: ${Duration( minutes: row['Segments'][0][0]['Duration']).toString().split(
                                          ':')[1]} hour",
                                      style: GoogleFonts.roboto(),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      'Non-Stop',
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Current Fare',
                                  style: GoogleFonts.roboto(),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '₹ ${row['Fare']['PublishedFare']}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}
