// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:travel_context/homescreen/home_page.dart';
import 'package:travel_context/main.dart';
import 'package:travel_context/mytrip/mytrip.dart';
import 'package:travel_context/profile/profile.dart';
import 'package:travel_context/wallet/wallet.dart';
class NarobototionPage extends StatefulWidget {
  const NarobototionPage({Key? key}) : super(key: key);

  @override
  State<NarobototionPage> createState() => _NarobototionPageState();
}

class _NarobototionPageState extends State<NarobototionPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = [
    HomeScreen(),
    MyTrip(),
    WalletPage(),
    ProfilePage()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search, color: Colors.white),
              label: 'My Trip',
            ),

            BottomNavigationBarItem(
              icon:
                  const Icon(Icons.wallet, color: Colors.white),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person, color: Colors.white),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFFF6E02),
          unselectedItemColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 22,
          onTap: _onItemTapped,
          // fixedColor: Colors.lightGreen,
          elevation:5),
    );
  }
}
