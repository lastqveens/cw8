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
    apiKey: 'AIzaSyCK9kE8zxDFFQF7Dogc9tQ5BiuQJiIDhhM',
    appId: '1:272584758662:web:f5132ca5e5bbd57e29c807',
    messagingSenderId: '272584758662',
    projectId: 'classwork8-17d87',
    authDomain: 'classwork8-17d87.firebaseapp.com',
    storageBucket: 'classwork8-17d87.firebasestorage.app',
    measurementId: 'G-7JXJW6HR34',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrpIx-xNX1gLyU93-Ckx-_-xVfHBRQo98',
    appId: '1:272584758662:android:e1cd9f484b6c0f0429c807',
    messagingSenderId: '272584758662',
    projectId: 'classwork8-17d87',
    storageBucket: 'classwork8-17d87.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlbws5LbAkJela2bekCXN5RQyn-wS8NIc',
    appId: '1:272584758662:ios:a31cb1a953e2491629c807',
    messagingSenderId: '272584758662',
    projectId: 'classwork8-17d87',
    storageBucket: 'classwork8-17d87.firebasestorage.app',
    iosBundleId: 'com.example.cw8',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlbws5LbAkJela2bekCXN5RQyn-wS8NIc',
    appId: '1:272584758662:ios:a31cb1a953e2491629c807',
    messagingSenderId: '272584758662',
    projectId: 'classwork8-17d87',
    storageBucket: 'classwork8-17d87.firebasestorage.app',
    iosBundleId: 'com.example.cw8',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCK9kE8zxDFFQF7Dogc9tQ5BiuQJiIDhhM',
    appId: '1:272584758662:web:502f7b9af105b25529c807',
    messagingSenderId: '272584758662',
    projectId: 'classwork8-17d87',
    authDomain: 'classwork8-17d87.firebaseapp.com',
    storageBucket: 'classwork8-17d87.firebasestorage.app',
    measurementId: 'G-6N0GFF9DX2',
  );
}
