// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA-NlIKFb2qvKXrVwJkXC1L7CtC2oGdALE',
    appId: '1:394377629061:web:46f6964b2af2f7e1b188ec',
    messagingSenderId: '394377629061',
    projectId: 'mobile-app-project-1567f',
    authDomain: 'mobile-app-project-1567f.firebaseapp.com',
    storageBucket: 'mobile-app-project-1567f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB25mKj-W8HsQ3-yfg1IVSo7bcYDYJSFRg',
    appId: '1:394377629061:android:c9573c1ec23e2f03b188ec',
    messagingSenderId: '394377629061',
    projectId: 'mobile-app-project-1567f',
    storageBucket: 'mobile-app-project-1567f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmyfXiD9Y91fx1xqLbjVrRW9DKFD-EX-c',
    appId: '1:394377629061:ios:b0a0a942036e3c2ab188ec',
    messagingSenderId: '394377629061',
    projectId: 'mobile-app-project-1567f',
    storageBucket: 'mobile-app-project-1567f.appspot.com',
    iosBundleId: 'com.appp.dorm_hubexample.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmyfXiD9Y91fx1xqLbjVrRW9DKFD-EX-c',
    appId: '1:394377629061:ios:b0a0a942036e3c2ab188ec',
    messagingSenderId: '394377629061',
    projectId: 'mobile-app-project-1567f',
    storageBucket: 'mobile-app-project-1567f.appspot.com',
    iosBundleId: 'com.appp.dorm_hubexample.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA-NlIKFb2qvKXrVwJkXC1L7CtC2oGdALE',
    appId: '1:394377629061:web:07f19fb82a7f199bb188ec',
    messagingSenderId: '394377629061',
    projectId: 'mobile-app-project-1567f',
    authDomain: 'mobile-app-project-1567f.firebaseapp.com',
    storageBucket: 'mobile-app-project-1567f.appspot.com',
  );

}