import 'dart:convert';
import 'package:search_choices/search_choices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_context/theme/color.dart';
import '/flight/flightsearch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class OnewayScreen extends StatefulWidget {
  const OnewayScreen({Key? key}) : super(key: key);

  @override
  State<OnewayScreen> createState() => _OnewayScreenState();
}

class _OnewayScreenState extends State<OnewayScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    dateinput1.text = ""; //set the initial value of text field
    super.initState();
    getPlaces();
  }

  int child = 0;
  int adult = 0;
  int infant = 0;

  List names = [];
  List sid = [];

  List alldata = [];

  int? fliteclass;

  getflitesearch() {
    print(dateinput.text);
    var arr = {
      "fromcity": _chosenValuefrom,
      "tocity": _chosenValuefrom2,
      "fromcityname": _chosenValueeto,
      "tocityname": _chosenValueeto2,
      "date": dateinput.text,
      "adult": adult.toString(),
      "child": child.toString(),
      "infant": infant.toString(),
      "cabinclass": fliteclass.toString(),
    };

    alldata.add(arr);

    Get.to(FlightSearch(alldata: alldata));
  }

  getPlaces() async {
    Uri myUri = Uri.parse('https://ridhitravels.in/app/api/city-flight.php');
    final response = await http.get(myUri);
    // body: data,
    print(myUri);
    if (response.statusCode == 200) {
      var re = jsonDecode(response.body);
      print("result");
      print(re);
      re.forEach((element) {
        setState(() {
          names.add(element['AirportName']);
          sid.add(element['cityCode'].toString());
        });
      });
    }
  }

  String? _chosenValueeto2;
  String? _chosenValuefrom2;
  String? _chosenValueeto;
  String? _chosenValuefrom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                // height: 85,
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    border: Border.all(width: 1, color: Color(0xFFCFCFCF))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        'FROM',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      child: SearchChoices.single(
                        underline: Container(),
                        items: names.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.visible,
                              style: TextStyle(color: Colors.black87),
                            ),
                          );
                        }).toList(),
                        value: _chosenValueeto,
                        hint: "Select City",
                        searchHint: "Select City",
                        onChanged: (value) {
                          setState(() {
                            _chosenValuefrom = sid[names
                                .indexWhere((note) => note.startsWith(value))];
                            // fromName = value;
                            // fromFull = value;

                            _chosenValueeto = value;

                            print(_chosenValuefrom);
                          });
                          // Navigator.of(context).pop();
                        },
                        doneButton: "Done",
                        displayItem: (item, selected) {
                          return (Row(children: [
                            selected
                                ? Icon(
                              Icons.radio_button_checked,
                              color: Colors.grey,
                            )
                                : Icon(
                              Icons.radio_button_unchecked,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 7),
                            Expanded(
                              child: item,
                            ),
                          ]));
                        },
                        isExpanded: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                //  height: 85,
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    border: Border.all(width: 1, color: Color(0xFFCFCFCF))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        'TO',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      child: SearchChoices.single(
                        underline: Container(),
                        items: names.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.visible,
                              style: TextStyle(color: Colors.black87),
                            ),
                          );
                        }).toList(),
                        value: _chosenValueeto2,
                        hint: "Select City",
                        searchHint: "Select City",
                        onChanged: (value) {
                          setState(() {
                            _chosenValuefrom2 = sid[names
                                .indexWhere((note) => note.startsWith(value))];
                            // fromName = value;
                            // fromFull = value;

                            _chosenValueeto2 = value;

                            print(_chosenValuefrom2);
                          });
                          // Navigator.of(context).pop();
                        },
                        doneButton: "Done",
                        displayItem: (item, selected) {
                          return (Row(children: [
                            selected
                                ? Icon(
                              Icons.radio_button_checked,
                              color: Colors.grey,
                            )
                                : Icon(
                              Icons.radio_button_unchecked,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 7),
                            Expanded(
                              child: item,
                            ),
                          ]));
                        },
                        isExpanded: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 320,
                    child: TextField(
                      controller: dateinput,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(0)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(0)),
                          labelText: ('DEPARTURE DATE'),
                          labelStyle: GoogleFonts.roboto(fontSize: 12),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                          ),
                          contentPadding: EdgeInsets.only(top: 10, left: 10)),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);

                          setState(() {
                            dateinput.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  // Container(
                  //   height: 50,
                  //   width: 160,
                  //   child: TextField(
                  //     controller: dateinput1,
                  //     decoration: InputDecoration(
                  //         fillColor: Colors.white,
                  //         focusedBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 1, color: Colors.grey),
                  //             borderRadius: BorderRadius.circular(0)),
                  //         enabledBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 1, color: Colors.grey),
                  //             borderRadius: BorderRadius.circular(0)),
                  //         border: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 1, color: Colors.grey),
                  //             borderRadius: BorderRadius.circular(0)),
                  //         labelText: ('RETURN DATE'),
                  //         labelStyle: GoogleFonts.roboto(fontSize: 12),
                  //         prefixIcon: Icon(
                  //           Icons.calendar_today,
                  //           color: Colors.red,
                  //         ),
                  //         contentPadding: EdgeInsets.only(top: 10, left: 10)),
                  //     readOnly: true,
                  //     onTap: () async {
                  //       DateTime? pickedDate = await showDatePicker(
                  //           context: context,
                  //           initialDate: DateTime.now(),
                  //           firstDate: DateTime(2000),
                  //           lastDate: DateTime(2101));
                  //
                  //       if (pickedDate != null) {
                  //         print(pickedDate);
                  //         String formattedDate =
                  //         DateFormat('yyyy-MM-dd').format(pickedDate);
                  //         print(formattedDate);
                  //
                  //         setState(() {
                  //           dateinput1.text = formattedDate;
                  //         });
                  //       } else {
                  //         print("Date is not selected");
                  //       }
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(20,0, 20, 0),
            //   child: Container(
            //     height: 85,
            //     width: 400,
            //     decoration: BoxDecoration(
            //         color: Color(0xFFf2f2f2),
            //         border: Border.all(width: 1, color: Color(0xFFCFCFCF))),
            //     child: ListTile(
            //       title: Text(
            //         'TRAVELLERS & CLASS',
            //         style: GoogleFonts.roboto(
            //             color: Colors.black, fontWeight: FontWeight.bold),
            //       ),
            //       subtitle: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             '1',
            //             style: GoogleFonts.roboto(
            //                 color: Colors.black, fontWeight: FontWeight.bold),
            //           ),
            //           Text(
            //             'INDRA GANDHI NATIONAL AIRPORT',
            //             style: GoogleFonts.roboto(
            //               color: Colors.black,
            //             ),
            //           ),
            //         ],
            //       ),
            //       trailing: Icon(
            //         Icons.flight_class_rounded,
            //         color: Colors.red,
            //         size: 50,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color(0xFFf2f2f2),
                        border: Border.all(width: 1, color: Color(0xFFCFCFCF))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  'ADULT',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 8),
                              child: Text(
                                '12Yr & Above',
                                style: GoogleFonts.roboto(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: Color(0xFFCFCFCF))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (adult > 1) {
                                      setState(() {
                                        adult--;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.remove)),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                adult.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (adult < 8) {
                                      setState(() {
                                        adult++;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.add))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color(0xFFf2f2f2),
                        border: Border.all(width: 1, color: Color(0xFFCFCFCF))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  'CHILDREN',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                '2-12Yr',
                                style: GoogleFonts.roboto(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: Color(0xFFCFCFCF))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (child > 0) {
                                      setState(() {
                                        child--;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.remove)),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                child.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (child < 4) {
                                      setState(() {
                                        child++;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.add))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Container(
                height: 75,
                width: 150,
                decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    border: Border.all(width: 1, color: Color(0xFFCFCFCF))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              'INFANT',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Under 2Yr',
                            style: GoogleFonts.roboto(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                          Border.all(width: 1, color: Color(0xFFCFCFCF))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                if (infant > 0) {
                                  setState(() {
                                    infant--;
                                  });
                                }
                              },
                              child: Icon(Icons.remove)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            infant.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                if (infant < 2) {
                                  setState(() {
                                    infant++;
                                  });
                                }
                              },
                              child: Icon(Icons.add))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'CHOOSE CABIN CLASS',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                    color: fliteclass == 1 ? Colors.blue : Color(0xFFf2f2f2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      fliteclass = 1;
                    });
                  },
                  child: Text(
                    'Economy/ Premium Economy',
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: fliteclass == 1 ? Colors.white : Colors.black,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 35,
                    width: 180,
                    decoration: BoxDecoration(
                        color:
                        fliteclass == 2 ? Colors.blue : Color(0xFFf2f2f2),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          fliteclass = 2;
                        });
                      },
                      child: Text(
                        'Premium Economy',
                        style: GoogleFonts.roboto(
                            fontSize: 12,
                            color:
                            fliteclass == 2 ? Colors.white : Colors.black,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                        color:
                        fliteclass == 3 ? Colors.blue : Color(0xFFf2f2f2),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          fliteclass = 3;
                        });
                      },
                      child: Text(
                        'First Class',
                        style: GoogleFonts.roboto(
                            fontSize: 12,
                            color:
                            fliteclass == 3 ? Colors.white : Colors.black,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 35,
                width: 180,
                decoration: BoxDecoration(
                    color: fliteclass == 4 ? Colors.blue : Color(0xFFf2f2f2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      fliteclass = 4;
                    });
                  },
                  child: Text(
                    'Business Class',
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: fliteclass == 4 ? Colors.white : Colors.black,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 10, 40, 10),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    getflitesearch();
                  },
                  child: Text(
                    'SEARCH FLIGHTS',
                    style: GoogleFonts.roboto(
                        fontSize: 12, color: Colors.white, letterSpacing: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
