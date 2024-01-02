import 'package:flutter/material.dart';
import 'package:sinau/screens/login.dart';
import 'package:sinau/screens/menu.dart';
import 'package:sinau/screens/register.dart';
import 'package:sinau/screens/onboarding.dart';
import 'package:sinau/screens/setup_user.dart';
import 'package:sinau/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
