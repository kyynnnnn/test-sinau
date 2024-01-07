import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/firebase/auth_service.dart';
import 'package:sinau/screens/login.dart';
import 'package:sinau/screens/setup_user.dart';
import 'package:sinau/widgets/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                  padding: const EdgeInsets.all(0),
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
                  "Ayo dulur, nikmati belajar Bahasa Jawa dengan cara baru",
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
                  "Buat akunmu dan dapatkan akses belajar Bahasa Jawa yang menarik.",
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
                  "Email Pengguna",
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
                    controller: emailController,
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
                      hintText: "Masukkan email",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Kata Sandi",
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
                    controller: passwordController,
                    obscureText: _isObscure,
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Masukkan kata sandi",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Konfirmasi Kata Sandi",
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
                    controller: confirmPasswordController,
                    obscureText: _isObscure,
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Masukkan kata sandi",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 56.0,
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
                    onPressed: () async {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        final result = await AuthService().register(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (result == 'true') {
                          Navigator.pushNamed(context, '/setup-user');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(result ?? 'An error Occurred')));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Kata Sandi tidak sama')));
                      }
                    },
                    child: Text(
                      "Daftar",
                      style: GoogleFonts.plusJakartaSans(
                          color: black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Sudah punya akun? Yuk masuk!",
                      style: GoogleFonts.plusJakartaSans(
                          color: blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
