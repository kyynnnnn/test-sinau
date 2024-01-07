import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/screens/register.dart';
import 'package:sinau/widgets/colors.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 88.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: Image(image: AssetImage('assets/images/logo.png'))),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: Image(
                  image: AssetImage('assets/images/Illustration_onboard.png'),
                  width: 325.0,
                ))
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            Text(
              "Nikmati mudahnya belajar Bahasa Jawa dimanapun dan kapanpun",
              style: GoogleFonts.plusJakartaSans(
                color: black,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "Dengan Sinau, belajar Bahasa Jawa jadi mudah dan menyenangkan",
              style: GoogleFonts.plusJakartaSans(
                color: gray,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 42.0,
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
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Mulai Belajar",
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
    );
  }
}
