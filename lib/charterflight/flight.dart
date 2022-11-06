import 'package:flutter/material.dart';
import 'package:travel_context/charterflight/onewaycharter.dart';
import '/flight/oneway.dart';
import 'roundtrip.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({Key? key}) : super(key: key);

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text('Flights',style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TabBar(
                      labelStyle:GoogleFonts.roboto(fontWeight: FontWeight.w700) ,
                      unselectedLabelColor: Colors.black,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 2,color: Colors.blue)),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.blue,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'ONE WAY',
                        ),
                        Tab(
                          text: 'ROUND TRIP',
                        )
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: TabBarView(children: [
              OnewayScreen(),
               RoundTrip()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
