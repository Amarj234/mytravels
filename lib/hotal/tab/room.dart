import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key, required List this.hotelroom}) : super(key: key);
final List hotelroom;
  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  String? choose;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.hotelroom);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.hotelroom.map((em){
            return     ListTile(
              leading: Image.asset('assets/images/para.jpg'),
              title: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.crop_square_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                       "Rs ${em['Price']['RoomPrice']}",
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_city_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Text(
                         em['RoomTypeName'].toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.bed_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Text(
                         em['Amenities'][0].toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),

SizedBox(height: 20,)
                ],
              ),
            );


          }).toList(),
        ),
      ),
    );
  }
}
