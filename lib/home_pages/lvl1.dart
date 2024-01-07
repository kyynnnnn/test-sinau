import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageLvl1 extends StatefulWidget {
  const pageLvl1({super.key});

  @override
  State<pageLvl1> createState() => _pageLvl1State();
}

class _pageLvl1State extends State<pageLvl1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text('Ini Halaman 1',
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700))),
      ),
    );
  }
}
