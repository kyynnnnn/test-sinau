import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/data/tap.dart';

class kosaKata extends StatefulWidget {
  const kosaKata({super.key});

  @override
  State<kosaKata> createState() => _kosaKataState();
}

class _kosaKataState extends State<kosaKata> {
  @override
  Widget build(BuildContext context) {
    return doubleTap(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Container(
                child: Text('Halaman Kosa Kata',
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700))),
          ),
        ),
      ),
    );
  }
}
