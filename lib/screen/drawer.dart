import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: 220,
     child: Drawer(
       child: ListView(
         children: [
       ListTile(
       leading: const Icon(
       Icons.account_box,
         color: Colors.grey,
       ),
       title: Text(
         'My Account ',
         style: TextStyle(color: Colors.black),
       ),
       onTap: () {

       },
     ),

           ListTile(
             leading:Image.asset('assets/images/business-trip.png'
               ,height: 20,width: 20,
             ),
             title: Text(
               'View/Manage Trip',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

           ListTile(
             leading: const Icon(
               Icons.bookmark_border,
               color: Colors.grey,
             ),
             title: Text(
               'Wishlist ',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

           ListTile(
             leading:Image.asset('assets/images/rewards.png',height: 20,width: 20,),
             title: Text(
               'Refer & Earn ',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

           ListTile(
             leading: const Icon(
               Icons.notifications,
               color: Colors.grey,
             ),
             title: Text(
               'Notification',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

           ListTile(
             leading: const Icon(
               Icons.card_giftcard,
               color: Colors.grey,
             ),
             title: Text(
               'GiftCard ',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

           ListTile(
             leading: const Icon(
               Icons.card_giftcard_sharp,
               color: Colors.grey,
             ),
             title: Text(
               'My Reward ',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

           ListTile(
             leading: const Icon(
               Icons.settings,
               color: Colors.grey,
             ),
             title: Text(
               'Setting',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),
           ListTile(
             leading: const Icon(
               Icons.star_rate,
               color: Colors.grey,
             ),
             title: Text(
               'Rate Us',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),
           ListTile(
             leading: const Icon(
               Icons.privacy_tip_outlined,
               color: Colors.grey,
             ),
             title: Text(
               'Privacy Policy',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

           ListTile(
             leading: const Icon(
               Icons.support,
               color: Colors.grey,
             ),
             title: Text(
               'Customer Support',
               style: TextStyle(color: Colors.black),
             ),
             onTap: () {

             },
           ),

     ] )
      ),
   );
  }
}
