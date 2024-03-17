// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:firebase_auth/firebase_auth.dart';
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
    apiKey: 'AIzaSyDEc6OJpHTDoSDD8gYPv6qMlEmmjiT-UAA',
    appId: '1:107497311568:web:415bced106a71a047a3055',
    messagingSenderId: '107497311568',
    projectId: 'farmer-480cb',
    authDomain: 'farmer-480cb.firebaseapp.com',
    storageBucket: 'farmer-480cb.appspot.com',
    measurementId: 'G-YT0G6VJ852',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6jCOsu974VOgAmj3W07yQq0bCh6GuEWA',
    appId: '1:107497311568:android:8358fc48051fb6077a3055',
    messagingSenderId: '107497311568',
    projectId: 'farmer-480cb',
    storageBucket: 'farmer-480cb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqh_SMpSptZ4vqUpbsqZLuUYtSUiWeH9A',
    appId: '1:107497311568:ios:70c239ae1b5162f47a3055',
    messagingSenderId: '107497311568',
    projectId: 'farmer-480cb',
    storageBucket: 'farmer-480cb.appspot.com',
    iosBundleId: 'com.example.farmer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqh_SMpSptZ4vqUpbsqZLuUYtSUiWeH9A',
    appId: '1:107497311568:ios:f30f27900e9bd11f7a3055',
    messagingSenderId: '107497311568',
    projectId: 'farmer-480cb',
    storageBucket: 'farmer-480cb.appspot.com',
    iosBundleId: 'com.example.farmer.RunnerTests',
  );
}