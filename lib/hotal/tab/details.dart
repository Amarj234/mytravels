import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.Description}) : super(key: key);
final Description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child:Description==null? Text(
                  "No Description",
                ) :Text(
                  Description.toString(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Amenities',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ps.png',
                            color: Colors.grey,
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 20,),
                          Text('Kitchen',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),
                    SizedBox(width: 70,),
                    Container(
                      child: Row(
                        children: [
                        Image.asset(
                        'assets/images/icon.png',
                        color: Colors.grey,
                        height: 30,
                        width: 30,
                      ),
                          SizedBox(width: 20,),
                      Text('Micro Owen',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    )


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
