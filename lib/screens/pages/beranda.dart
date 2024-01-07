import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/firebase/auth_service.dart';
import 'package:sinau/widgets/colors.dart';
import 'package:sinau/widgets/list_menu.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    getNamed();
  }

  void getNamed() async {
    final tes = await AuthService().getName();

    setState(() {
      name = tes.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) >
                Duration(seconds: 2)) {
          currentBackPressTime = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tekan lagi untuk keluar'),
              duration: Duration(seconds: 2),
            ),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                          name,
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
                      color: black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 550.0,
                  child: ListViewCustom(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
