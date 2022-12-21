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
    apiKey: 'AIzaSyBqnYuF9btadHw1JdT0Gid_y-y9juqDcT0',
    appId: '1:582003499202:web:749aa13ca0e8d4443edb5b',
    messagingSenderId: '582003499202',
    projectId: 'tirynski-d9a08',
    authDomain: 'tirynski-d9a08.firebaseapp.com',
    storageBucket: 'tirynski-d9a08.appspot.com',
    measurementId: 'G-WS1KSPLXFW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSV7O3Mn9bjGlBuAh_B9mTLwqNwQT2oEA',
    appId: '1:582003499202:android:9409304b280217823edb5b',
    messagingSenderId: '582003499202',
    projectId: 'tirynski-d9a08',
    storageBucket: 'tirynski-d9a08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtHRcI-5k5LP4BUYifzM8fnSKW5oYKqZ0',
    appId: '1:582003499202:ios:6470bda2004afb613edb5b',
    messagingSenderId: '582003499202',
    projectId: 'tirynski-d9a08',
    storageBucket: 'tirynski-d9a08.appspot.com',
    iosClientId: '582003499202-sdp7ahbkohp8pnook52g0501t2dmvapu.apps.googleusercontent.com',
    iosBundleId: 'com.example.trynsikiAdminPanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtHRcI-5k5LP4BUYifzM8fnSKW5oYKqZ0',
    appId: '1:582003499202:ios:6470bda2004afb613edb5b',
    messagingSenderId: '582003499202',
    projectId: 'tirynski-d9a08',
    storageBucket: 'tirynski-d9a08.appspot.com',
    iosClientId: '582003499202-sdp7ahbkohp8pnook52g0501t2dmvapu.apps.googleusercontent.com',
    iosBundleId: 'com.example.trynsikiAdminPanel',
  );
}
