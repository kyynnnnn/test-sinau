import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageLvl3 extends StatefulWidget {
  const pageLvl3({super.key});

  @override
  State<pageLvl3> createState() => _pageLvl3State();
}

class _pageLvl3State extends State<pageLvl3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text('Ini Halaman 3',
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700))),
      ),
    );
  }
}
