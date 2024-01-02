import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:sinau/screens/home_screen.dart';
import 'package:sinau/screens/menu.dart';
import 'package:sinau/widgets/colors.dart';

class SetupUser extends StatefulWidget {
  const SetupUser({super.key});

  @override
  State<SetupUser> createState() => _SetupUserState();
}

class _SetupUserState extends State<SetupUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 72.0,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: black,
                  size: 24.0,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                "Tinggal satu langkah lagi.",
                style: GoogleFonts.plusJakartaSans(
                  color: black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "Isi informasi di bawah ini untuk melanjutkan.",
                style: GoogleFonts.plusJakartaSans(
                  color: gray,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                "Nama Pengguna",
                style: GoogleFonts.plusJakartaSans(
                  color: black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: gray)),
                child: TextField(
                  style: GoogleFonts.plusJakartaSans(
                      color: black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Masukkan nama pengguna",
                    hintStyle: GoogleFonts.plusJakartaSans(
                        color: gray,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 200.0,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 50.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MenuTab()));
                  },
                  child: Text(
                    "Lanjutkan",
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
