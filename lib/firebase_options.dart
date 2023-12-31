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
    apiKey: 'AIzaSyBRo2xBDwgBrCdEZ7s9BsK8Zboq9XAPw3w',
    appId: '1:936704099054:web:d6e211a1c4406e9009a9ff',
    messagingSenderId: '936704099054',
    projectId: 'odevs-flutter',
    authDomain: 'odevs-flutter.firebaseapp.com',
    databaseURL: 'https://odevs-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'odevs-flutter.appspot.com',
    measurementId: 'G-KGBDXC8W9Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfkfq3HLVfj9goV0kevXnqn891eHB3Cyw',
    appId: '1:936704099054:android:eda7d5c28a3eb7fc09a9ff',
    messagingSenderId: '936704099054',
    projectId: 'odevs-flutter',
    databaseURL: 'https://odevs-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'odevs-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXUCYiQOMdFaBdneCwlygdf6ttrRec4Kk',
    appId: '1:936704099054:ios:ba261a8e09b135ea09a9ff',
    messagingSenderId: '936704099054',
    projectId: 'odevs-flutter',
    databaseURL: 'https://odevs-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'odevs-flutter.appspot.com',
    iosClientId: '936704099054-q1tulrkcbgef5j4r357t0l0qf957nbva.apps.googleusercontent.com',
    iosBundleId: 'com.baerhousprojects.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAXUCYiQOMdFaBdneCwlygdf6ttrRec4Kk',
    appId: '1:936704099054:ios:e895b1f6c487515009a9ff',
    messagingSenderId: '936704099054',
    projectId: 'odevs-flutter',
    databaseURL: 'https://odevs-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'odevs-flutter.appspot.com',
    iosClientId: '936704099054-6golmh74hhnqh6ngvfucsc4vsnmptntq.apps.googleusercontent.com',
    iosBundleId: 'com.baerhousprojects.chatApp.RunnerTests',
  );
}
