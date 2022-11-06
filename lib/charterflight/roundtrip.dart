import 'package:flutter/material.dart';
import '/flight/flightsearch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTrip extends StatefulWidget {
  const RoundTrip({Key? key}) : super(key: key);

  @override
  State<RoundTrip> createState() => _RoundTripState();
}

class _RoundTripState extends State<RoundTrip> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  int? fliteclass;
  @override
  void initState() {
    dateinput.text = "";
    dateinput1.text = "";//set the initial value of text field
    super.initState();
  }

  int child=0;
  int adult=0;
  int infant=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _showMyDialog();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 85,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      border: Border.all(
                          width: 1,
                          color: Color(0xFFCFCFCF)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          'FROM',
                          style:GoogleFonts.roboto (
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'New Delhi , India',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Icon(
                              Icons.flight_takeoff_rounded,
                              color: Colors.blue,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'INDRA GHADHI INTERNATION, AIRPORT',
                          style: GoogleFonts.roboto(color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showMyDialog();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 85,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      border: Border.all(
                          width: 1,
                          color: Color(0xFFCFCFCF)
                      )
                  ),
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
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Varanasi , India',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Icon(
                              Icons.flight_land_outlined,
                              color: Colors.blue,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'INDRA GHADHI INTERNATION, AIRPORT',
                          style: GoogleFonts.roboto(color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 160,
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
                         // hintText: ('DEPARTURE DATE'),
                          //hintStyle: TextStyle(fontSize: 12),
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
                  Container(
                    height: 50,
                    width: 160,
                    child: TextField(
                      controller: dateinput1,
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
                          hintText: ('RETURN DATE'),
                          hintStyle: TextStyle(fontSize: 12),
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
                            dateinput1.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                height: 85,
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    border: Border.all(
                        width: 1,
                        color: Color(0xFFCFCFCF)
                    )
                ),
                child: ListTile(
                  title: Text(
                    'TRAVELLERS & CLASS',
                    style: GoogleFonts.roboto(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1',
                        style: GoogleFonts.roboto(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'INDRA GANDHI NATIONAL AIRPORT',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.flight_class_rounded,
                    color: Colors.blue,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
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
                                '12Yr & Above',style: GoogleFonts.roboto(),
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
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: (){
                                    if(adult>1){
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
                                  onTap: (){
                                    if(adult<8){
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
                                  style:  GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                '2-12Yr',style: GoogleFonts.roboto(),
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
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: (){
                                    if(child>0){
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
                                  onTap: (){
                                    if(child<4){
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
                            'Under 2Yr',style: GoogleFonts.roboto(),
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
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: (){
                                if(infant>0){
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
                              onTap: (){
                                if(infant<2){
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
                style:  GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 35,
                width: 300,
                decoration: BoxDecoration(
                    color: fliteclass == 1 ? Colors.blue : Color(0xFFf2f2f2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      fliteclass = 1;
                    });
                  },
                  child:  Text(
                    'Economy/ Premium Economy',
                    style:  GoogleFonts.roboto(
                        fontSize: 12,  color: fliteclass == 1 ? Colors.white : Colors.black, letterSpacing: 2),
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
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 35,
                    width: 180,
                    decoration: BoxDecoration(
                       color: fliteclass == 2 ? Colors.blue : Color(0xFFf2f2f2),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          fliteclass = 2;
                        });
                      },
                      child:  Text(
                        'Premium Economy',
                        style:  GoogleFonts.roboto(
                            fontSize: 12,
                            color:
                            fliteclass == 2 ? Colors.white : Colors.black,
                            letterSpacing: 2),
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
                      child:  Text(
                        'First Class',
                        style:  GoogleFonts.roboto(
                            fontSize: 12,
                            color:
                            fliteclass == 3 ? Colors.white : Colors.black,
                            letterSpacing: 2),
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
                    style:  GoogleFonts.roboto(
                        fontSize: 12,   color: fliteclass == 4 ? Colors.white : Colors.black, letterSpacing: 2),
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
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                  //  Get.to(FlightSearch());
                  },
                  child: Text(
                    'SEARCH FLIGHTS',
                    style:  GoogleFonts.roboto(
                        fontSize: 12, color: Colors.white, letterSpacing: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextField(
                        enabled: true,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: (''
                                'Indra Gandhi International Airport'),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.only(top: 10, left: 10)),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextField(
                        enabled: true,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: (''
                                'Indra Gandhi International Airport'),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.only(top: 10, left: 10)),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
