import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageLvl4 extends StatefulWidget {
  const pageLvl4({super.key});

  @override
  State<pageLvl4> createState() => _pageLvl4State();
}

class _pageLvl4State extends State<pageLvl4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text('Ini Halaman 4',
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700))),
      ),
    );
  }
}
