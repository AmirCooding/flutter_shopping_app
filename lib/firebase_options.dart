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
    apiKey: 'AIzaSyCTwjvvy_ZnygYNOt8H8uwca8Ph5qJ6CZo',
    appId: '1:689460655392:web:dc4bd4ff203c468fd85345',
    messagingSenderId: '689460655392',
    projectId: 'u-store-b9593',
    authDomain: 'u-store-b9593.firebaseapp.com',
    storageBucket: 'u-store-b9593.appspot.com',
    measurementId: 'G-T924JD3YHD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvakXJv_0oAFrLlWco2jjciR_DFAjdMs0',
    appId: '1:689460655392:android:5e93dde0c16cff8ad85345',
    messagingSenderId: '689460655392',
    projectId: 'u-store-b9593',
    storageBucket: 'u-store-b9593.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBACqvfNY3xGj7flnJ3EQ1nFwrz4R6DveU',
    appId: '1:689460655392:ios:1ffbe212feeb0d2bd85345',
    messagingSenderId: '689460655392',
    projectId: 'u-store-b9593',
    storageBucket: 'u-store-b9593.appspot.com',
    iosClientId: '689460655392-sq63ssaknqpm8aug7nu66esprq9i713b.apps.googleusercontent.com',
    iosBundleId: 'com.example.ustore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBACqvfNY3xGj7flnJ3EQ1nFwrz4R6DveU',
    appId: '1:689460655392:ios:1ffbe212feeb0d2bd85345',
    messagingSenderId: '689460655392',
    projectId: 'u-store-b9593',
    storageBucket: 'u-store-b9593.appspot.com',
    iosClientId: '689460655392-sq63ssaknqpm8aug7nu66esprq9i713b.apps.googleusercontent.com',
    iosBundleId: 'com.example.ustore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTwjvvy_ZnygYNOt8H8uwca8Ph5qJ6CZo',
    appId: '1:689460655392:web:0ed3f51129b855ecd85345',
    messagingSenderId: '689460655392',
    projectId: 'u-store-b9593',
    authDomain: 'u-store-b9593.firebaseapp.com',
    storageBucket: 'u-store-b9593.appspot.com',
    measurementId: 'G-M05VFYG9Z3',
  );
}
