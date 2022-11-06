import 'dart:convert';

import 'package:flutter/material.dart';
import '/hotal/tab/details.dart';
import '/hotal/tab/review.dart';
import '/hotal/tab/room.dart';
import '/theme/color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:http/http.dart' as http;
class BookedHotal extends StatefulWidget {
   BookedHotal({Key? key, required this.index, required this.hotelcode, required this.trackerid}) : super(key: key);
final index,hotelcode,trackerid;
  @override
  State<BookedHotal> createState() => _BookedHotalState();
}

class _BookedHotalState extends State<BookedHotal> {
  List hotelroom = [];
  List hoteldata12 = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    searchHotels();

  }
  List image = [];
  searchHotels() async {
    final uri = Uri.parse("https://ridhitravels.in/app/api/select-hotel-type.php?resultInd=${widget.index}&hotelCode=${widget.hotelcode}&traceId=${widget.trackerid}");
     print(uri);
    final response = await http.post(uri,body: {

    });
    var state = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        loadImage = false;
       hoteldata12.add(state['HotelInfo']['HotelInfoResult']['HotelDetails']);
        image=(state['HotelInfo']['HotelInfoResult']['HotelDetails']['Images']);
        hotelroom=(state['HotelRoom']['GetHotelRoomResult']['HotelRoomsDetails']);
      });
    }
  }
  bool loadImage =true;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          title: Text(
            'Hotal Details',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: loadImage?Center(child: CircularProgressIndicator()):hoteldata12.length==0? Center(child: Text("Data not Found"),) : SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: hoteldata12.map((row) {
              return    Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ImageSlideshow(
                              width: double.infinity,
                              height: 150,
                              initialPage: 0,
                              indicatorColor: Colors.blue,
                              indicatorBackgroundColor: Colors.grey,
                              children: image.map((e) {
                                return  Container(
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                          NetworkImage(e.toString()),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    // child: Icon(
                                    //     Icons.favorite,
                                    //     size: 40,color: Colors.white
                                    // ),
                                  ),
                                );
                              }).toList(),
                              onPageChanged: (value) {
                                //print('Page changed: $value');
                              },
                              autoPlayInterval: 3000,
                              isLoop: true,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              row['HotelName'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, bottom: 8),
                            child: Text(
                              row['Address'].toString(),
                              style:
                              TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Column(
                              //   children: [
                              //     Text(
                              //       'Price',
                              //       style: TextStyle(
                              //           color: Colors.grey,
                              //           fontWeight: FontWeight.bold),
                              //     ),
                              //     SizedBox(
                              //       height: 5,
                              //     ),
                              //     Container(
                              //       padding: EdgeInsets.only(left: 10),
                              //       child: Text(
                              //         "Rs ${row['HotelName']}",
                              //         style: TextStyle(
                              //             color: Colors.black,
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 16),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Column(
                                children: [
                                  Text(
                                    'Review',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[900],
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[900],
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[900],
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[900],
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue[100],
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue[100],
                                backgroundImage: AssetImage(
                                  'assets/images/share.png',
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Card(
                            elevation: 10,

                            child: TabBar(
                                unselectedLabelColor: Colors.black,
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(width: 2,color: Colors.red)),
                                indicatorSize: TabBarIndicatorSize.label,
                                labelColor: Colors.red,
                                tabs: [
                                  Tab(
                                    text: 'DETAILS',
                                  ),
                                  Tab(
                                    text: 'ROOMS',
                                  ),
                                  Tab(
                                    text: 'REVIEWS',
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 400,
                            child: TabBarView(children: [
                              Details(Description:row['Description']),
                              RoomPage(hotelroom:hotelroom.toList()),
                              ReviewPage()
                            ]),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.red[900],
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                  onPressed: () {
                                  },
                                  child: const Text(
                                    'BOOK NOW',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white, letterSpacing: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              );
            }).toList(),
          ),
        )),
      ),
    );
  }
}
