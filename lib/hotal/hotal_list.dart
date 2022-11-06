import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import '/hotal/book_hotal.dart';
import '/theme/color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HotalList extends StatefulWidget {
  const HotalList({Key? key, required this.alldata}) : super(key: key);
  final List alldata;

  @override
  State<HotalList> createState() => _HotalListState();
}

class _HotalListState extends State<HotalList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchHotels();
    print(widget.alldata);
  }

String? trackerid;
  List hoteldata12 = [];


  searchHotels() async {
    final uri = Uri.parse("https://ridhitravels.in/app/api/searchhotel.php");
    // print(cid);
    final response = await http.post(uri,body: {
      'data':jsonEncode(widget.alldata),
    });
    var state = json.decode(response.body);

    if (response.statusCode == 200) {

      setState(() {

        hoteldata12 = state['HotelSearchResult']['HotelResults'];
        trackerid=state['HotelSearchResult']['TraceId'];
        loadImage = false;
      });

      print(trackerid);
    }

  }
bool loadImage =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'Hotal Page',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: loadImage?Center(child: CircularProgressIndicator()):hoteldata12.length==0? Center(child: Text("Data not Found"),) : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: hoteldata12.map((data) {
             return  InkWell(
                onTap: (){
                  Get.to(BookedHotal(index:data['ResultIndex'],hotelcode:data['HotelCode'],trackerid:trackerid));
                },
                child: Padding(
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
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                data['HotelPicture']),
                                            fit: BoxFit.cover)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                          Icons.favorite,
                                          size: 40,color: Colors.white
                                      ),
                                    ),
                                  ),


                                ],
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
                             // padding: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/2,
                                    child: Text(
                                      data['HotelName'].toString(),
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                    RatingBar.builder(
                      initialRating: double.parse(data['StarRating'].toString()),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                   //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => SizedBox(
                        width: 2,
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.2,
                                    child: Text(
                                      data['HotelAddress'].toString(),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(left:10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Brakfast Included',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Text(
                                      '₹ ${data['Price']['OfferedPrice']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    )
                                  ],
                                )),
                            Container(
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    '₹ ${data['Price']['PublishedPriceRoundedOff']}',style: TextStyle(decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    '+₹ ${data['Price']['Tax']} Taxes & Fees',
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Great Choice! Booked 200+ times\nin last 15 days',
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Per Knight',
                                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
