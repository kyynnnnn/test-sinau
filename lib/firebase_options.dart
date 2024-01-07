// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCfLF00qLqpldutGCScCLktZ_0Kc2ZVBu0',
    appId: '1:673639868309:web:9bc02e0c0c9972c743389c',
    messagingSenderId: '673639868309',
    projectId: 'sinau-26acd',
    authDomain: 'sinau-26acd.firebaseapp.com',
    storageBucket: 'sinau-26acd.appspot.com',
    measurementId: 'G-V8XM0SPW18',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeShS9j22DayMhRROMI-Au22r_2xLn2vc',
    appId: '1:673639868309:android:226c9c9bfaf686bb43389c',
    messagingSenderId: '673639868309',
    projectId: 'sinau-26acd',
    storageBucket: 'sinau-26acd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-aXgruI6OLjmyGIjbFT2qYgpiKKzPErA',
    appId: '1:673639868309:ios:df2b263585528a1643389c',
    messagingSenderId: '673639868309',
    projectId: 'sinau-26acd',
    storageBucket: 'sinau-26acd.appspot.com',
    iosBundleId: 'com.example.sinau',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-aXgruI6OLjmyGIjbFT2qYgpiKKzPErA',
    appId: '1:673639868309:ios:fec1efaef05e0e4943389c',
    messagingSenderId: '673639868309',
    projectId: 'sinau-26acd',
    storageBucket: 'sinau-26acd.appspot.com',
    iosBundleId: 'com.example.sinau.RunnerTests',
  );
}
