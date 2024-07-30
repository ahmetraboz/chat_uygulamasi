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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDojgVfYozhHobbkmXl4zRFPoeoDzM64Uo',
    appId: '1:878509052117:android:e8cf6ab3fb36de47dad25c',
    messagingSenderId: '878509052117',
    projectId: 'chat-boss-10cb0',
    databaseURL: 'https://chat-boss-10cb0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chat-boss-10cb0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBORS5GAYraH5fJiMyuipxtAD_yiXcp22w',
    appId: '1:878509052117:ios:bc6c80b9b7915bafdad25c',
    messagingSenderId: '878509052117',
    projectId: 'chat-boss-10cb0',
    databaseURL: 'https://chat-boss-10cb0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chat-boss-10cb0.appspot.com',
    iosBundleId: 'com.example.chatUygulamasi',
  );

}