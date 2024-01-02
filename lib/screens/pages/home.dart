import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/widgets/colors.dart';
import 'package:sinau/widgets/list_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 72.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, Selamat datang!',
                        style: GoogleFonts.plusJakartaSans(
                            color: gray,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Nama',
                        style: GoogleFonts.plusJakartaSans(
                            color: black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Mau belajar apa hari ini?',
                style: GoogleFonts.plusJakartaSans(
                    color: black, fontSize: 28.0, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 950.0,
                child: ListViewCustom(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
