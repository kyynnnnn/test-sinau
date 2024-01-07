import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:sinau/data/DoubleTapObserver.dart';
import 'package:sinau/data/routing.dart';
import 'package:sinau/firebase_options.dart';
import 'package:sinau/screens/pages/profile_edit.dart';
// import 'package:sinau/screens/login.dart';
// import 'package:sinau/screens/menu.dart';
// import 'package:sinau/screens/register.dart';
// import 'package:sinau/screens/onboarding.dart';
// import 'package:sinau/screens/setup_user.dart';
import 'package:sinau/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Sinau());
}

class Sinau extends StatelessWidget {
  const Sinau({super.key});

// class _SinauState extends State<Sinau> {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   String? start() {
//     if (auth.currentUser == null) {
//       return '/';
//     } else {
//       return '/home';
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sinau",
      //navigatorObservers: [DoubleTapObserver()],
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: '/',
      routes: Routing.generate(),
    );
  }
}
