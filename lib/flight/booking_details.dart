import 'package:flutter/material.dart';
import '/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key, required  this.alldata}) : super(key: key);
final List alldata;
  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {

  List<TextEditingController> alultname = [];
  List<TextEditingController> adultnumber = [];
  List<TextEditingController> adultemail = [];
  List<TextEditingController> adultaddress = [];
  List<TextEditingController> adultaddress2 = [];
  List<TextEditingController> adultcity = [];
  List<TextEditingController> adultdob = [];

  List<TextEditingController> childname = [];
  List<TextEditingController> childnumber = [];
  List<TextEditingController> childemail = [];
  List<TextEditingController> childaddress = [];
  List<TextEditingController> childaddress2 = [];
  List<TextEditingController> childcity = [];
  List<TextEditingController> childdob = [];

  List<TextEditingController> infantname = [];
  List<TextEditingController> infantnumber = [];
  List<TextEditingController> infantemail = [];
  List<TextEditingController> infantaddress = [];
  List<TextEditingController> infantaddress2 = [];
  List<TextEditingController> infantcity = [];
  List<TextEditingController> infantdob = [];

  final Map adultgender = {};
  final Map childgender = {};
  final Map infantgender = {};

  List alladult=[];
  List allchild=[];
  List allinfant=[];


  Saveall(){
    for(int i=0;i<alultname.length;i++) {
      var arrslt={
        "alultname":alultname[i].text,
        "adultnumber":adultnumber[i].text,
        "adultemail":adultemail[i].text,
        "adultaddress":adultaddress[i].text,
        "adultaddress2":adultaddress2[i].text,
        "adultdob":adultdob[i].text,
        "adultgender":adultgender[i],
      };
      alladult.add(arrslt);
    }
    for(int i=0;i<childname.length;i++) {
      var arrslt={
        "childname":childname[i].text,
        "childnumber":childnumber[i].text,
        "childemail":childemail[i].text,
        "childaddress":childaddress[i].text,
        "adultaddress2":childaddress2[i].text,
        "adultdob":adultdob[i].text,
        "adultgender":adultgender[i],
      };
      allchild.add(arrslt);
    }

    for(int i=0;i<infantname.length;i++) {
      var arrslt={
        "childname":infantname[i].text,
        "childnumber":infantnumber[i].text,
        "childemail":infantemail[i].text,
        "childaddress":infantaddress[i].text,
        "adultaddress2":infantaddress2[i].text,
        "adultdob":infantdob[i].text,
        "adultgender":infantgender[i],
      };
      allinfant.add(arrslt);
    }

  }


gettotal(){



}

  int totaladult=0;
  int totalchild=0;
  int totalinfant=0;
  int totalsum=0;


  List mydata=[];
  List apidata=[];
  List alldatas=[];
  initState(){
    super.initState();

    alldatas =widget.alldata;
    mydata.add(alldatas[0]['mydata']);
    apidata.add(alldatas[0]['apidata']);

    if(int.parse(mydata[0]['NoOfAdutls'])>0){
  totaladult=apidata[0]['FareBreakdown'][0]['BaseFare']+apidata[0]['FareBreakdown'][2]['Tax'];
    }else{
      totaladult=0;
    }
    if(int.parse(mydata[0]['NoOfAdutls'])>0){
      totalchild=apidata[0]['FareBreakdown'][1]['BaseFare']+apidata[0]['FareBreakdown'][1]['Tax'];
    }else{
      totalchild=0;
    }
    if(int.parse(mydata[0]['NoOfAdutls'])>0){
     totalinfant=apidata[0]['FareBreakdown'][2]['BaseFare']+apidata[0]['FareBreakdown'][2]['Tax'];
    }else{
      totalinfant=0;
    }

    totalsum=totaladult+totalchild+totalinfant;
   // print(totaladult+totalchild+totalinfant);
  }

  String? dropdownValue;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Details',
          style:  GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height*.01,
              // ),
              Container(
                height: MediaQuery.of(context).size.height
                *(int.parse(mydata[0]['NoOfAdutls'])/1.65),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    itemCount:int.parse(mydata[0]['NoOfAdutls']),
                    itemBuilder: (BuildContext context, int index) {

                      alultname.add(new TextEditingController());
                      adultnumber.add(new TextEditingController());
                      adultemail.add(new TextEditingController());
                      adultaddress.add(new TextEditingController());
                      adultaddress2.add(new TextEditingController());
                      adultdob.add(new TextEditingController());
                      adultcity.add(new TextEditingController());

                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color(0xFFff9696),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                 onPressed: (){},
                                  child:  Text(
                                    'Aduts-${index+1}',
                                    style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color:Colors.black,
                                        letterSpacing:1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20,10, 20, 10),
                              child: Form(
                              //  key: formKey,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12,top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      TextFormField(

                                         controller:alultname[index],
                                        // // initialValue: widget.contactModel.name,
                                        // onChanged: (value) => widget.contactModel.name = value,
                                        // onSaved: (value) => widget.contactModel.name = value,
                                        // validator: (value) => value.length > 3 ? null : "Enter Name",
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Name",
                                          labelText: "Name",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),

                                      Container(
                                        decoration:BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                            )

                                        ),
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              icon: Icon(Icons.generating_tokens, color: Colors.black12,),
                                              hintText: 'Gender',
                                              border: InputBorder.none),

                                          value: adultgender[index],
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "Male",
                                              child: Text("Male"),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "Female",
                                              child: Text("Female"),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "Other",
                                              child: Text("Other"),
                                            )


                                          ],
                                          onChanged: ( newStateId) {
                                            setState(() {

                                              adultgender[index] = newStateId;
                                            });
                                          },

                                        ),
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),


                                      TextFormField(
                                        controller:adultnumber[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Number",
                                          labelText: "Number",
                                        ),
                                      ),

                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller:adultemail[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Email",
                                          labelText: "Email",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller:adultaddress[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Address",
                                          labelText: "Address",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller:adultaddress2[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Address 2",
                                          labelText: "Address",
                                        ),
                                      ),


                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller:adultdob[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "DOB",
                                          labelText: "Date of Birth",
                                        ),
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
                                             adultdob[index].text = formattedDate;
                                            });
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              Container(
                height: MediaQuery.of(context).size.height
                    *(int.parse(mydata[0]['NoOfChild'])/1.65),
                child: ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    itemCount:int.parse(mydata[0]['NoOfChild']),
                    itemBuilder: (BuildContext context, int index) {
                      childname.add(new TextEditingController());
                      childnumber.add(new TextEditingController());
                      childemail.add(new TextEditingController());
                      childaddress.add(new TextEditingController());
                      childaddress2.add(new TextEditingController());
                      childdob.add(new TextEditingController());
                      childcity.add(new TextEditingController());
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color(0xFFff9696),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                  onPressed: (){},
                                  child:  Text(
                                    'Children-${index+1}',
                                    style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color:Colors.black,
                                        letterSpacing:1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20,10, 20, 10),
                              child: Form(
                                //  key: formKey,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12,top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      TextFormField(

                                         controller: childname[index],
                                        // // initialValue: widget.contactModel.name,
                                        // onChanged: (value) => widget.contactModel.name = value,
                                        // onSaved: (value) => widget.contactModel.name = value,
                                        // validator: (value) => value.length > 3 ? null : "Enter Name",
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Name",
                                          labelText: "Name",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration:BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey
                                          )

                      ),
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              icon: Icon(Icons.generating_tokens, color: Colors.black12,),
                                              hintText: 'Gender',
                                              border: InputBorder.none),

                                          value: childgender[index],
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "Male",
                                              child: Text("Male"),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "Female",
                                              child: Text("Female"),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "Other",
                                              child: Text("Other"),
                                            )


                                          ],
                                          onChanged: ( newStateId) {
                                            setState(() {

                                              childgender[index] = newStateId;
                                            });
                                          },

                                        ),
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      // FlatButton(
                                      //   color: Colors.white,
                                      //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      //   onPressed: () {
                                      //     _selectDDate(context);
                                      //   },
                                      //   child: buildDateSelector('DOB', selecteddDate),
                                      // ),
                                      TextFormField(
                                        controller: childnumber[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Number",
                                          labelText: "Number",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: childemail[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Email",
                                          labelText: "Email",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: childaddress[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Address",
                                          labelText: "Address",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: childaddress2[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Address 2",
                                          labelText: "Address",
                                        ),
                                      ), SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: childcity[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter City",
                                          labelText: "City",
                                        ),
                                      ), SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: childdob[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "DOB",
                                          labelText: "Date of Birth",
                                        ),
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
                                                childdob[index].text = formattedDate;
                                            });
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              Container(
                height: MediaQuery.of(context).size.height
                    *(int.parse(mydata[0]['NoOfInfant'])/1.65),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                 primary: false,
                    itemCount:int.parse(mydata[0]['NoOfInfant']),
                    itemBuilder: (BuildContext context, int index) {

                      infantname.add(new TextEditingController());
                      infantnumber.add(new TextEditingController());
                      infantemail.add(new TextEditingController());
                      infantaddress.add(new TextEditingController());
                      infantaddress2.add(new TextEditingController());
                      infantdob.add(new TextEditingController());
                      infantcity.add(new TextEditingController());
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color(0xFFff9696),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                  onPressed: (){},
                                  child:  Text(
                                    'Infant-${index+1}',
                                    style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color:Colors.black,
                                        letterSpacing:1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20,10, 20, 10),
                              child: Form(
                                //  key: formKey,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12,top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      TextFormField(
                                        controller: infantname[index],
                                        // controller: widget._nameController,
                                        // // initialValue: widget.contactModel.name,
                                        // onChanged: (value) => widget.contactModel.name = value,
                                        // onSaved: (value) => widget.contactModel.name = value,
                                        // validator: (value) => value.length > 3 ? null : "Enter Name",
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Name",
                                          labelText: "Name",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration:BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                            )

                                        ),
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                              icon: Icon(Icons.generating_tokens, color: Colors.black12,),
                                              hintText: 'Gender',
                                              border: InputBorder.none),

                                          value: infantgender[index],
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "Male",
                                              child: Text("Male"),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "Female",
                                              child: Text("Female"),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "Other",
                                              child: Text("Other"),
                                            )


                                          ],
                                          onChanged: ( newStateId) {
                                            setState(() {

                                              infantgender[index] = newStateId;
                                            });
                                          },

                                        ),
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      // FlatButton(
                                      //   color: Colors.white,
                                      //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      //   onPressed: () {
                                      //     _selectDDate(context);
                                      //   },
                                      //   child: buildDateSelector('DOB', selecteddDate),
                                      // ),
                                      TextFormField(
                                        controller: infantnumber[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Number",
                                          labelText: "Number",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: infantemail[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Email",
                                          labelText: "Email",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: infantaddress[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Address",
                                          labelText: "Address",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: infantaddress2[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Address 2",
                                          labelText: "Address",
                                        ),
                                      ), SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: infantcity[index],
                                        // controller: widget._emailController,
                                        // onChanged: (value) => widget.contactModel.email = value,
                                        // onSaved: (value) => widget.contactModel.email = value,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "Enter City",
                                          labelText: "City",
                                        ),
                                      ), SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: infantdob[index],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                          border: OutlineInputBorder(),
                                          hintText: "DOB",
                                          labelText: "Date of Birth",
                                        ),
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
                                               infantdob[index].text = formattedDate;
                                            });
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),

      ),
      bottomNavigationBar: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Rs $totalsum",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {},
                child:  Text(
                  'CONFIRM',
                  style:  GoogleFonts.roboto(
                      fontSize: 16, color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
