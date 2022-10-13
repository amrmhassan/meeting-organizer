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
    apiKey: 'AIzaSyADYsMVz-hEXEJTFdKswtb7m48iBtKAmjg',
    appId: '1:279606639513:web:9c922faac4629bdb91f108',
    messagingSenderId: '279606639513',
    projectId: 'meeting-organizer-56d96',
    authDomain: 'meeting-organizer-56d96.firebaseapp.com',
    storageBucket: 'meeting-organizer-56d96.appspot.com',
    measurementId: 'G-CXVHGHYNDC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm6lsyzNd4re1qDsDzF4pFQFVgovcdYk0',
    appId: '1:279606639513:android:8cf1f4501743c4a391f108',
    messagingSenderId: '279606639513',
    projectId: 'meeting-organizer-56d96',
    storageBucket: 'meeting-organizer-56d96.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcWN6BhPg6vW8_DoYGXA8OJvOq6RYU2Aw',
    appId: '1:279606639513:ios:0508c2f6c830453c91f108',
    messagingSenderId: '279606639513',
    projectId: 'meeting-organizer-56d96',
    storageBucket: 'meeting-organizer-56d96.appspot.com',
    iosClientId: '279606639513-rhn0565ko6rd4mucjoiv05lehs5hvo2p.apps.googleusercontent.com',
    iosBundleId: 'com.example.meetingOrganizer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcWN6BhPg6vW8_DoYGXA8OJvOq6RYU2Aw',
    appId: '1:279606639513:ios:0508c2f6c830453c91f108',
    messagingSenderId: '279606639513',
    projectId: 'meeting-organizer-56d96',
    storageBucket: 'meeting-organizer-56d96.appspot.com',
    iosClientId: '279606639513-rhn0565ko6rd4mucjoiv05lehs5hvo2p.apps.googleusercontent.com',
    iosBundleId: 'com.example.meetingOrganizer',
  );
}