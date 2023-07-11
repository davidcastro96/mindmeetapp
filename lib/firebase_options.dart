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
    apiKey: 'AIzaSyBMU5ruBcQelOQGK1nX7QPTmnoeyf84xu8',
    appId: '1:152164213746:web:2a498272836a87f0ca816b',
    messagingSenderId: '152164213746',
    projectId: 'banded-4ee14',
    authDomain: 'banded-4ee14.firebaseapp.com',
    databaseURL: 'https://banded-4ee14.firebaseio.com',
    storageBucket: 'banded-4ee14.appspot.com',
    measurementId: 'G-BQDHSKZZMX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRqUaEi1DZBgxLU_FnMfipCodgaiTrzLQ',
    appId: '1:152164213746:android:480931f1cda6aa65ca816b',
    messagingSenderId: '152164213746',
    projectId: 'banded-4ee14',
    databaseURL: 'https://banded-4ee14.firebaseio.com',
    storageBucket: 'banded-4ee14.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlRxwKlSed8Df7ySOlNEjiy4n2fN-CK4M',
    appId: '1:152164213746:ios:cc3f51d8fabb9e05ca816b',
    messagingSenderId: '152164213746',
    projectId: 'banded-4ee14',
    databaseURL: 'https://banded-4ee14.firebaseio.com',
    storageBucket: 'banded-4ee14.appspot.com',
    iosClientId:
        '152164213746-7k5283sfji4hrnamo5m79ojfh2uh9dbn.apps.googleusercontent.com',
    iosBundleId: 'com.example.mindmeetapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlRxwKlSed8Df7ySOlNEjiy4n2fN-CK4M',
    appId: '1:152164213746:ios:cc3f51d8fabb9e05ca816b',
    messagingSenderId: '152164213746',
    projectId: 'banded-4ee14',
    databaseURL: 'https://banded-4ee14.firebaseio.com',
    storageBucket: 'banded-4ee14.appspot.com',
    iosClientId:
        '152164213746-7k5283sfji4hrnamo5m79ojfh2uh9dbn.apps.googleusercontent.com',
    iosBundleId: 'com.example.mindmeetapp',
  );
}
