import 'package:flutter/material.dart';

class doubleTap extends StatelessWidget {
  DateTime? currentBackPressTime;
  Widget child;

  doubleTap({super.key, required this.child});

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
              duration: Duration(seconds: 1),
            ),
          );
          return false;
        }
        return true;
      },
      child: child,
    );
  }
}
