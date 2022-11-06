import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';
import 'package:travel_context/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';
import '/hotal/hotal_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HotalPage extends StatefulWidget {
  const HotalPage({Key? key}) : super(key: key);

  @override
  State<HotalPage> createState() => _HotalPageState();
}

class _HotalPageState extends State<HotalPage> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    dateinput1.text = ""; //set the initial value of text field
    super.initState();
    getPlaces();
  }

  TextEditingController dateinput1 = TextEditingController();

List names=[];
  List sid=[];

 List alldata=[];

 getPlaces() async {

    Uri myUri = Uri.parse('https://ridhitravels.in/app/api/city-hotel.php');
    final response = await http.post(myUri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        });
        // body: data,

    if (response.statusCode == 200) {
   var   re = jsonDecode(response.body);
      print("result");
      print(re);
      re.forEach((element) {
        print('ActivityID' + element['cityID'].toString());

        print('Activity' + element['hotelName']);
        setState(() {
          names.add(element['hotelName']);
          sid.add(element['cityID'].toString());
        });

      });
    }
  }

  String? day;

  getnextpage(){
    alldata=[];
    DateTime frist=DateFormat("dd/MM/yyyy").parse(dateinput.text);
    DateTime secend=DateFormat("dd/MM/yyyy").parse(dateinput1.text);

    Duration diff=  secend.difference(frist);
    setState((){
      day=diff.inDays.toString();
    });

   var arr={
     'cityid':_chosenValuefrom.toString(),
     'firstdate':dateinput.text,
     'secenddate':dateinput1.text,
     "rooms":dropdownValue2,
     "aduls" :adult.toString(),
     "children":child.toString(),
      "day":day

   };
    alldata.add(arr);




   Get.to(()=> HotalList(alldata:alldata));



  }



String? _chosenValuefrom;

 int? valid;


  String? dropdownValue;
  String? dropdownValue2;
  String? _chosenValueeto;
  int adult=1;
  int child=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Search Hotels',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
               child:SearchChoices.single(
                   underline:SizedBox(),
                      items: names.map<DropdownMenuItem<String>>(( value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            overflow: TextOverflow.visible,
                            style:  TextStyle(color: Colors.black87),
                          ),
                        );
                      }).toList(),
                      value: _chosenValueeto,
                      hint: "Select City",
                      searchHint: "Select City",
                      onChanged: (value) {
                        setState(() {
                          _chosenValuefrom =
                          sid[names.indexWhere((note) => note.startsWith(value))];
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
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 160,
                    child: TextField(
                      controller: dateinput,
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
                          hintText: ('CHECK-IN DATE'),
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
                              DateFormat('dd/MM/yyyy').format(pickedDate);
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
                    height: 40,
                    width: 160,
                    child: TextField(
                      controller: dateinput1,
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
                          hintText: ('CHECK-OUT DATE'),
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
                              DateFormat('dd/MM/yyyy').format(pickedDate);
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
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: DropdownButtonFormField<String>(
                  key: UniqueKey(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'NUMBER OF ROOMS',
                    contentPadding: EdgeInsets.only(left: 10, top: 10),
                    suffixStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  value: dropdownValue2,
                  items: [
                    DropdownMenuItem<String>(
                      value: "1",
                      child: Text("1"),
                    ),
                    DropdownMenuItem<String>(
                      value: "2",
                      child: Text("2"),
                    ),
                    DropdownMenuItem<String>(
                      value: "3",
                      child: Text("3"),
                    ),
                    DropdownMenuItem<String>(
                      value: "4",
                      child: Text("4"),
                    ),
                    DropdownMenuItem<String>(
                      value: "5",
                      child: Text("5"),
                    )
                  ],
                  onChanged: (String? newStateId) {
                    setState(() {
                      dropdownValue2 = newStateId!;
                      valid=int.parse(dropdownValue2.toString())*2;
                      adult=1;
                      child=0;
                    });
                  },
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //   child: DropdownButtonFormField<String>(
              //     key: UniqueKey(),
              //     decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.grey, width: 1),
              //           borderRadius: BorderRadius.circular(10)),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.grey, width: 1),
              //           borderRadius: BorderRadius.circular(10)),
              //       labelText: 'NUMBER OF GUEST',
              //       contentPadding: EdgeInsets.only(left: 10, top: 10),
              //       suffixStyle: TextStyle(
              //           color: Colors.grey, fontWeight: FontWeight.bold),
              //     ),
              //     value: dropdownValue,
              //     items: [
              //       DropdownMenuItem<String>(
              //         value: "1",
              //         child: Text("1"),
              //       ),
              //       DropdownMenuItem<String>(
              //         value: "2",
              //         child: Text("2"),
              //       ),
              //       DropdownMenuItem<String>(
              //         value: "3",
              //         child: Text("3"),
              //       ),
              //       DropdownMenuItem<String>(
              //         value: "4",
              //         child: Text("4"),
              //       ),
              //       DropdownMenuItem<String>(
              //         value: "5",
              //         child: Text("5"),
              //       )
              //     ],
              //     onChanged: (String? newStateId) {
              //       setState(() {
              //         dropdownValue = newStateId!;
              //       });
              //     },
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      height: 75,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color(0xFFf2f2f2),
                          border:
                              Border.all(width: 1, color: Color(0xFFCFCFCF))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        'ADULT',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    height: 40,
                                    width: 110,
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
                                              if(adult<valid!){
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: 75,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color(0xFFf2f2f2),
                          border:
                              Border.all(width: 1, color: Color(0xFFCFCFCF))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        'CHILDREN',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 40,
                                    width: 110,
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
                                          if(child<valid!){
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      getnextpage();
                    },
                    child: const Text(
                      'SEARCH HOTELS',
                      style: TextStyle(
                          fontSize: 16, color: Colors.white, letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 1,
              //   color: Colors.grey,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   padding: EdgeInsets.only(left: 10),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Top Rated',
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(
              //         width: 5,
              //       ),
              //       Text(
              //         'Hotels',
              //         style: TextStyle(
              //             color: Colors.red,
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              //
              //
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Card(
              //     elevation: 10,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20)
              //     ),
              //     child: Container(
              //         padding: EdgeInsets.only(left: 10, right: 10),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(top: 8.0),
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(15),
              //                 child: Image.asset('assets/images/para.jpg'),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Text(
              //                     'Hotel Paradaise',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16),
              //                   ),
              //                   SizedBox(
              //                     width: 2,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   SizedBox(
              //                     width: 40,
              //                   ),
              //                   Icon(Icons.favorite_border)
              //                 ],
              //               ),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Icon(
              //                   Icons.location_on,
              //                   color: Colors.red,
              //                 ),
              //                 Text(
              //                   'New Delhi',
              //                   style: TextStyle(color: Colors.black),
              //                 )
              //               ],
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 5),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     alignment: Alignment.center,
              //                     height: 20,
              //                     width: 30,
              //                     decoration: BoxDecoration(
              //                         color: Colors.blue,
              //                         borderRadius: BorderRadius.circular(5)),
              //                     child: Text('4.5'),
              //                   ),
              //                   SizedBox(
              //                     width: 3,
              //                   ),
              //                   Text('(245 Rating & 56 Reviews)')
              //                 ],
              //               ),
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Text(
              //                 '₹ 1300',
              //                 style: TextStyle(
              //                     color: Colors.black, fontWeight: FontWeight.bold),
              //               ),
              //
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     '₹ 1999',
              //                     style: TextStyle(
              //                         decoration: TextDecoration.lineThrough),
              //                   ),
              //                   SizedBox(width: 5,),
              //                   Text(
              //                     '22% off',
              //                     style: TextStyle(
              //                         color: Colors.green, fontWeight: FontWeight.bold),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ListTile(
              //             title:   Container(
              //               height: 40,
              //               width: 170,
              //               decoration: BoxDecoration(
              //                   color: Colors.red[900],
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: FlatButton(
              //                 onPressed: () {
              //
              //                 },
              //                 child: const Text(
              //                   'Check Rooms',
              //                   style: TextStyle(fontSize: 16, color: Colors.white,letterSpacing: 2),
              //                 ),
              //               ),
              //             ),
              //           )
              //
              //           ],
              //         )),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Card(
              //     elevation: 10,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)
              //     ),
              //     child: Container(
              //         padding: EdgeInsets.only(left: 10, right: 10),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(top: 8.0),
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(15),
              //                 child: Image.asset('assets/images/noi.jpg'),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Text(
              //                     'Fortune',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16),
              //                   ),
              //                   SizedBox(
              //                     width: 2,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   SizedBox(
              //                     width: 40,
              //                   ),
              //                   Icon(Icons.favorite_border)
              //                 ],
              //               ),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Icon(
              //                   Icons.location_on,
              //                   color: Colors.red,
              //                 ),
              //                 Text(
              //                   'Noida',
              //                   style: TextStyle(color: Colors.black),
              //                 )
              //               ],
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 5),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     alignment: Alignment.center,
              //                     height: 20,
              //                     width: 30,
              //                     decoration: BoxDecoration(
              //                         color: Colors.blue,
              //                         borderRadius: BorderRadius.circular(5)),
              //                     child: Text('4.5'),
              //                   ),
              //                   SizedBox(
              //                     width: 3,
              //                   ),
              //                   Text('(245 Rating & 56 Reviews)')
              //                 ],
              //               ),
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Text(
              //                 '₹ 1300',
              //                 style: TextStyle(
              //                     color: Colors.black, fontWeight: FontWeight.bold),
              //               ),
              //
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     '₹ 1999',
              //                     style: TextStyle(
              //                         decoration: TextDecoration.lineThrough),
              //                   ),
              //                   SizedBox(width: 5,),
              //                   Text(
              //                     '22% off',
              //                     style: TextStyle(
              //                         color: Colors.green, fontWeight: FontWeight.bold),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             ListTile(
              //               title:   Container(
              //                 height: 40,
              //                 width: 170,
              //                 decoration: BoxDecoration(
              //                     color: Colors.red[900],
              //                     borderRadius: BorderRadius.circular(10)),
              //                 child: FlatButton(
              //                   onPressed: () {
              //
              //                   },
              //                   child: const Text(
              //                     'Check Rooms',
              //                     style: TextStyle(fontSize: 16, color: Colors.white,letterSpacing: 2),
              //                   ),
              //                 ),
              //               ),
              //             )
              //
              //           ],
              //         )),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Card(
              //     elevation: 10,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)
              //     ),
              //     child: Container(
              //         padding: EdgeInsets.only(left: 10, right: 10),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(top: 8.0),
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(15),
              //                 child: Image.asset('assets/images/taj.jpg'),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Text(
              //                     'Taj Palace',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16),
              //                   ),
              //                   SizedBox(
              //                     width: 2,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   SizedBox(
              //                     width: 40,
              //                   ),
              //                   Icon(Icons.favorite_border)
              //                 ],
              //               ),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Icon(
              //                   Icons.location_on,
              //                   color: Colors.red,
              //                 ),
              //                 Text(
              //                   'Varanasi(UP)',
              //                   style: TextStyle(color: Colors.black),
              //                 )
              //               ],
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 5),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     alignment: Alignment.center,
              //                     height: 20,
              //                     width: 30,
              //                     decoration: BoxDecoration(
              //                         color: Colors.blue,
              //                         borderRadius: BorderRadius.circular(5)),
              //                     child: Text('4.5'),
              //                   ),
              //                   SizedBox(
              //                     width: 3,
              //                   ),
              //                   Text('(245 Rating & 56 Reviews)')
              //                 ],
              //               ),
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Text(
              //                 '₹ 1300',
              //                 style: TextStyle(
              //                     color: Colors.black, fontWeight: FontWeight.bold),
              //               ),
              //
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     '₹ 1999',
              //                     style: TextStyle(
              //                         decoration: TextDecoration.lineThrough),
              //                   ),
              //                   SizedBox(width: 5,),
              //                   Text(
              //                     '22% off',
              //                     style: TextStyle(
              //                         color: Colors.green, fontWeight: FontWeight.bold),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             ListTile(
              //               title:   Container(
              //                 height: 40,
              //                 width: 170,
              //                 decoration: BoxDecoration(
              //                     color: Colors.red[900],
              //                     borderRadius: BorderRadius.circular(10)),
              //                 child: FlatButton(
              //                   onPressed: () {
              //
              //                   },
              //                   child: const Text(
              //                     'Check Rooms',
              //                     style: TextStyle(fontSize: 16, color: Colors.white,letterSpacing: 2),
              //                   ),
              //                 ),
              //               ),
              //             )
              //
              //           ],
              //         )),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Card(
              //     elevation: 10,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)
              //     ),
              //     child: Container(
              //         padding: EdgeInsets.only(left: 10, right: 10),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(top: 8.0),
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(15),
              //                 child: Image.asset('assets/images/jai.jpg'),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Text(
              //                     'Leela Palace ',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16),
              //                   ),
              //                   SizedBox(
              //                     width: 2,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.yellow,
              //                   ),
              //                   SizedBox(
              //                     width: 40,
              //                   ),
              //                   Icon(Icons.favorite_border)
              //                 ],
              //               ),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Icon(
              //                   Icons.location_on,
              //                   color: Colors.red,
              //                 ),
              //                 Text(
              //                   'Jaipur',
              //                   style: TextStyle(color: Colors.black),
              //                 )
              //               ],
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 5),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     alignment: Alignment.center,
              //                     height: 20,
              //                     width: 30,
              //                     decoration: BoxDecoration(
              //                         color: Colors.blue,
              //                         borderRadius: BorderRadius.circular(5)),
              //                     child: Text('4.5'),
              //                   ),
              //                   SizedBox(
              //                     width: 3,
              //                   ),
              //                   Text('(245 Rating & 56 Reviews)')
              //                 ],
              //               ),
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Text(
              //                 '₹ 1300',
              //                 style: TextStyle(
              //                     color: Colors.black, fontWeight: FontWeight.bold),
              //               ),
              //
              //             ),
              //             Container(
              //               padding: EdgeInsets.only(left: 10),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     '₹ 1999',
              //                     style: TextStyle(
              //                         decoration: TextDecoration.lineThrough),
              //                   ),
              //                   SizedBox(width: 5,),
              //                   Text(
              //                     '22% off',
              //                     style: TextStyle(
              //                         color: Colors.green, fontWeight: FontWeight.bold),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             ListTile(
              //               title:   Container(
              //                 height: 40,
              //                 width: 170,
              //                 decoration: BoxDecoration(
              //                     color: Colors.red[900],
              //                     borderRadius: BorderRadius.circular(10)),
              //                 child: FlatButton(
              //                   onPressed: () {
              //
              //                   },
              //                   child: const Text(
              //                     'Check Rooms',
              //                     style: TextStyle(fontSize: 16, color: Colors.white,letterSpacing: 2),
              //                   ),
              //                 ),
              //               ),
              //             )
              //
              //           ],
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
