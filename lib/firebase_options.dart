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
    apiKey: 'AIzaSyBfu1CN1BKW6NsCcYpRBuJl_Si81nqQyvk',
    appId: '1:24984891146:web:980361a0de4f605bbcd4f3',
    messagingSenderId: '24984891146',
    projectId: 'blood-donation-90c81',
    authDomain: 'blood-donation-90c81.firebaseapp.com',
    storageBucket: 'blood-donation-90c81.appspot.com',
    measurementId: 'G-WDKD6WPG8N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt2QxNrlPel41LrWjlEiyOkfPBo3pNTJc',
    appId: '1:24984891146:android:1f378654f0419a98bcd4f3',
    messagingSenderId: '24984891146',
    projectId: 'blood-donation-90c81',
    storageBucket: 'blood-donation-90c81.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIY2QmajVsqe_k4P0_gW5eFMRv8PDjow4',
    appId: '1:24984891146:ios:6fa6938497ef42aabcd4f3',
    messagingSenderId: '24984891146',
    projectId: 'blood-donation-90c81',
    storageBucket: 'blood-donation-90c81.appspot.com',
    iosClientId: '24984891146-p14ol29u1p52bn13s9r1jlbcnvec03lo.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonationApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIY2QmajVsqe_k4P0_gW5eFMRv8PDjow4',
    appId: '1:24984891146:ios:6fa6938497ef42aabcd4f3',
    messagingSenderId: '24984891146',
    projectId: 'blood-donation-90c81',
    storageBucket: 'blood-donation-90c81.appspot.com',
    iosClientId: '24984891146-p14ol29u1p52bn13s9r1jlbcnvec03lo.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonationApp',
  );
}
