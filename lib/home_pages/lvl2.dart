import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageLvl2 extends StatefulWidget {
  const pageLvl2({super.key});

  @override
  State<pageLvl2> createState() => _pageLvl2State();
}

class _pageLvl2State extends State<pageLvl2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text('Ini Halaman 2',
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700))),
      ),
    );
  }
}
