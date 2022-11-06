import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/bond.jpg'),
                ),
                title: Text(
                  'Raj Kumar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  '3.5/5',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('1  Lovely hotel in an excellent location.')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.only(left: 10),child: Text('2  Love the rooms, staff are friendly and professional and breakfast was delicious. 5 minutes walk to Roma termini')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('3  I stayed as a single person for an overnight visit. '))
            ],
          ),
        ),
      ),
    );
  }
}
