import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_context/charterflight/flight.dart';
import 'package:travel_context/flight/oneway.dart';
import 'package:travel_context/hotal/hotal_page.dart';
import 'package:travel_context/trending.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }
  late TabController _tabController;
  void _handleTabSelection() {
    setState(() {

    });
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // drawer: DrawerPage(),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: 140,
      //   flexibleSpace: SizedBox(
      //     child: Container(
      //       padding: EdgeInsets.only(left: 0, top: 50),
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 15,
      //                     backgroundColor: Color(0xFFB2EBF2),
      //                     child: SizedBox(
      //                       width: 25,
      //                       height: 25,
      //                       child: ClipOval(
      //                         child: Image.asset('assets/images/airplane.png'),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     'Flights',
      //                     style: GoogleFonts.roboto(
      //                         fontSize: 12, fontWeight: FontWeight.bold),
      //                   )
      //                 ],
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 15,
      //                     backgroundColor: Color(0xFFB2EBF2),
      //                     child: SizedBox(
      //                       width: 25,
      //                       height: 25,
      //                       child: ClipOval(
      //                         child: Image.asset('assets/images/hotel (1).png'),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     'Hotels',
      //                     style: GoogleFonts.roboto(
      //                         fontSize: 12, fontWeight: FontWeight.bold),
      //                   )
      //                 ],
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 15,
      //                     backgroundColor: Color(0xFFB2EBF2),
      //                     child: SizedBox(
      //                       width: 25,
      //                       height: 25,
      //                       child: ClipOval(
      //                         child:
      //                             Image.asset('assets/images/coconut-tree.png'),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     'Holiday',
      //                     style: GoogleFonts.roboto(
      //                         fontSize: 12, fontWeight: FontWeight.bold),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 15,
      //                     backgroundColor: Color(0xFFB2EBF2),
      //                     child: SizedBox(
      //                       width: 25,
      //                       height: 25,
      //                       child: ClipOval(
      //                         child: Image.asset('assets/images/visa.png'),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     'Visa',
      //                     style: GoogleFonts.roboto(
      //                         fontSize: 12, fontWeight: FontWeight.bold),
      //                   )
      //                 ],
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 15,
      //                     backgroundColor: Color(0xFFB2EBF2),
      //                     child: SizedBox(
      //                       width: 25,
      //                       height: 25,
      //                       child: ClipOval(
      //                         child: Image.asset(
      //                             'assets/images/chartered-flight.png'),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     'Charter Flights',
      //                     style: GoogleFonts.roboto(
      //                         fontSize: 12, fontWeight: FontWeight.bold),
      //                   )
      //                 ],
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 15,
      //                     backgroundColor: Color(0xFFB2EBF2),
      //                     child: SizedBox(
      //                       width: 25,
      //                       height: 25,
      //                       child: ClipOval(
      //                         child: Image.asset('assets/images/agent.png'),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     'Activities',
      //                     style: GoogleFonts.roboto(
      //                         fontSize: 12, fontWeight: FontWeight.bold),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      //   // leading: InkWell(
      //   //     onTap: () {
      //   //       DrawerPage();
      //   //       scaffoldKey.currentState?.openDrawer();
      //   //     },
      //   //     child: Icon(
      //   //       Icons.menu,
      //   //       color: Colors.black,
      //   //     )),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Get.to( OnewayPage());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:Colors.blue,
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: ClipOval(
                            child: Image.asset('assets/images/airplane (1).png',color: Colors.white,),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Flights',
                        style: GoogleFonts.roboto(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(HotalPage());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:Colors.blue,
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: ClipOval(
                            child: Image.asset('assets/images/hotels (1).png',color: Colors.white,),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hotels',
                        style: GoogleFonts.roboto(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor:Colors.blue,
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: ClipOval(
                          child:
                          Image.asset('assets/images/sunbed.png',color: Colors.white,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Holiday,\nPackage',
                      style: GoogleFonts.roboto(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor:Colors.blue,
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: ClipOval(
                          child: Image.asset('assets/images/visa (1).png',color: Colors.white,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Visa',
                      style: GoogleFonts.roboto(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){
                    Get.to(FlightPage());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:Colors.blue,
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: ClipOval(
                            child: Image.asset(
                                'assets/images/chartered-flight (1).png',color: Colors.white,),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Charter\nFlights',
                        style: GoogleFonts.roboto(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor:Colors.blue,
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: ClipOval(
                          child: Image.asset('assets/images/old-people.png',color: Colors.white,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Activities',
                      style: GoogleFonts.roboto(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Trending Hotel Searches',
                style: GoogleFonts.viga(fontSize: 18, color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Based on traveller searches around you',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            //  width: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Image.asset('assets/images/jai.jpg')),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hotel Paradaise',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'New Delhi',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      'Brakfast Included',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '₹ 8990',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(right: 10, left: 10, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  '₹ 500',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    ' ₹1500 Taxes & Fees',
                                    style: GoogleFonts.roboto(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              'Per Knight',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            //  width: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Image.asset('assets/images/jai.jpg')),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hotel Paradaise',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'New Delhi',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      'Brakfast Included',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '₹ 8990',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(right: 10, left: 10, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  '₹ 500',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    ' ₹1500 Taxes & Fees',
                                    style: GoogleFonts.roboto(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              'Per Knight',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            //  width: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Image.asset('assets/images/jai.jpg')),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hotel Paradaise',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'New Delhi',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      'Brakfast Included',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '₹ 8990',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(right: 10, left: 10, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  '₹ 500',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    ' ₹1500 Taxes & Fees',
                                    style: GoogleFonts.roboto(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              'Per Knight',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            //  width: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Image.asset('assets/images/jai.jpg')),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hotel Paradaise',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'New Delhi',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      'Brakfast Included',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '₹ 8990',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(right: 10, left: 10, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  '₹ 500',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    ' ₹1500 Taxes & Fees',
                                    style: GoogleFonts.roboto(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              'Per Knight',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
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
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Discover yourself with us',
                style: GoogleFonts.viga(fontSize: 18, color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Amazing activities curated just for you',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/lotus.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 30,
                                bottom: 20,
                                child: Text(
                                  'New Delhi',
                                  style: GoogleFonts.viga(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/lot.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 30,
                                bottom: 20,
                                child: Text(
                                  'Australia',
                                  style: GoogleFonts.viga(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/eifeal.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 22,
                                bottom: 20,
                                child: Text(
                                  'Eifeal Tower',
                                  style: GoogleFonts.viga(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/lotus.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 30,
                                bottom: 20,
                                child: Text(
                                  'New Delhi',
                                  style: GoogleFonts.viga(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/lot.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 30,
                                bottom: 20,
                                child: Text(
                                  'Australia',
                                  style: GoogleFonts.viga(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/eifeal.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 22,
                                bottom: 20,
                                child: Text(
                                  'Eifeal Tower',
                                  style: GoogleFonts.viga(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Offer For You',
                style: GoogleFonts.viga(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Curated specially for you',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TabBar(
                        isScrollable: true,
                          controller: _tabController,
                          labelStyle:GoogleFonts.roboto(fontSize:12
                              ,fontWeight: FontWeight.w700) ,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          labelColor: Colors.white,
                          indicatorColor: Colors.black,
                          tabs:[
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                              color:_tabController.index==0 ?Colors.blue:Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color:Color(0xFFCFCFCF),)
                          ),
                          child: Tab(
                            text: 'TRENDING',
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                              color:_tabController.index==1 ?Colors.blue:Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color:Color(0xFFCFCFCF),)
                          ),
                          child: Tab(
                            text: 'FLIGHTS',
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                              color:_tabController.index==2 ?Colors.blue:Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color:Color(0xFFCFCFCF),)
                          ),
                          child: Tab(
                            text: 'HOTELS',
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                              color:_tabController.index==3 ?Colors.blue:Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color:Color(0xFFCFCFCF),)
                          ),
                          child: Tab(
                            text: 'HOLIDAYS',
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
              height: 500,
                      child: TabBarView(
                        controller: _tabController,
                          children: [
                            TrendingPage(),
                            TrendingPage(),
                            TrendingPage(),
                            TrendingPage(),

                      ]),
                    )

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
