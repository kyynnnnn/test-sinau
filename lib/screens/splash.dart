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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Onboarding()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

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
                scale: 8,
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
