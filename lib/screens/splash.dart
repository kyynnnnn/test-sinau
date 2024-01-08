import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinau/screens/onboarding.dart';
import 'package:sinau/widgets/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await checkLoginStatus();

    // Delay selama 2 detik
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Onboarding()));
    });
  }

  Future<void> checkLoginStatus() async {
    // Simulasi pengecekan status login
    await Future.delayed(const Duration(seconds: 2));

    final FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     //checkLoginStatus();
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacementNamed(context, '/onboard');
//     });
//   }

  // Future<void> checkLoginStatus() async {
  //   await Future.delayed(const Duration(seconds: 2));

  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   if (auth.currentUser == null) {
  //     Navigator.pushReplacementNamed(context, '/');
  //   } else {
  //     Navigator.pushReplacementNamed(context, '/home');
  //   }
  // }
  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(color: blue),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.scale(
                scale: 7,
                child: Container(
                  width: 100.0,
                  height: MediaQuery.sizeOf(context).height / 9,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: shadowBlue),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: Image(image: AssetImage('assets/images/splash.png')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
