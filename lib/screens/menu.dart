import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/screens/pages/dict.dart';
import 'package:sinau/screens/pages/profile.dart';
import 'package:sinau/widgets/colors.dart';
import 'package:sinau/screens/pages/beranda.dart';
//import 'package:sinau/screens/pages/profil';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    kosaKata(),
    ProfilePagee(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: gray, width: 1.0))),
        height: 60.0,
        child: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Kosa Kata',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 10.0),
          unselectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 10.0),
          selectedItemColor: blue,
          unselectedItemColor: gray,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
