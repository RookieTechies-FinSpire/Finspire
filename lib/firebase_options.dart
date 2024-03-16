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
    apiKey: 'AIzaSyDsXg7_BYOyD4pwLh99KKGuJNbH4slgMmk',
    appId: '1:967345484832:web:9db4a10f6a9164d14f3845',
    messagingSenderId: '967345484832',
    projectId: 'rookietechies-95e53',
    authDomain: 'rookietechies-95e53.firebaseapp.com',
    storageBucket: 'rookietechies-95e53.appspot.com',
    measurementId: 'G-JPDPGMVBCT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGkct-Ix3PZZTLpFZN2eEVyFDKqODbAvU',
    appId: '1:967345484832:android:98f656dd742171ae4f3845',
    messagingSenderId: '967345484832',
    projectId: 'rookietechies-95e53',
    storageBucket: 'rookietechies-95e53.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDj1MStWSvJgyaKX_qLQkqvdO4rhWs8Ugc',
    appId: '1:967345484832:ios:ae776bcfca4282d04f3845',
    messagingSenderId: '967345484832',
    projectId: 'rookietechies-95e53',
    storageBucket: 'rookietechies-95e53.appspot.com',
    iosBundleId: 'com.example.fintectBot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDj1MStWSvJgyaKX_qLQkqvdO4rhWs8Ugc',
    appId: '1:967345484832:ios:a70c7604b10c8fc54f3845',
    messagingSenderId: '967345484832',
    projectId: 'rookietechies-95e53',
    storageBucket: 'rookietechies-95e53.appspot.com',
    iosBundleId: 'com.example.fintectBot.RunnerTests',
  );
}
