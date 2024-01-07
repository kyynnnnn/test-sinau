import 'package:flutter/material.dart';
import 'package:sinau/home_pages/lvl1.dart';
import 'package:sinau/home_pages/lvl2.dart';
import 'package:sinau/home_pages/lvl3.dart';
import 'package:sinau/home_pages/lvl4.dart';
import 'package:sinau/screens/login.dart';
import 'package:sinau/screens/menu.dart';
import 'package:sinau/screens/onboarding.dart';
import 'package:sinau/screens/pages/beranda.dart';
//import 'package:sinau/screens/pages/profil';
import 'package:sinau/screens/pages/profile.dart';
import 'package:sinau/screens/pages/profile_edit.dart';
import 'package:sinau/screens/register.dart';
import 'package:sinau/screens/setup_user.dart';

import '../screens/splash.dart';

class Routing {
  static Map<String, Widget Function(BuildContext)> generate() {
    return {
      '/': (context) => const SplashScreen(),
      '/profile': (context) => ProfilePagee(),
      '/edit-profile': (context) => const EditProfilePage(),
      '/home': (context) => const BottomNavigationBarExample(),
      '/login': (context) => const LoginScreen(),
      '/register': (context) => const RegisterScreen(),
      '/setup-user': (context) => const SetupUser(),
      '/onboarding': (context) => const Onboarding(),
      '/lvl1': (context) => const pageLvl1(),
      '/lvl2': (context) => const pageLvl2(),
      '/lvl3': (context) => const pageLvl3(),
      '/lvl4': (context) => const pageLvl4(),
    };
  }
}
