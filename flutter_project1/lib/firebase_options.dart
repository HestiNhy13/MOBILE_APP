import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDyVQQhE-WJd-6m6Z1vrlslp-kLwMYt0',
    appId: '1:319212580240:web:911750372700fbbe46a195',
    messagingSenderId: '319212580240',
    projectId: 'belajar-firebase-a73bc',
    authDomain: 'belajar-firebase-a73bc.firebaseapp.com',
    databaseURL:
        'https://belajar-firebase-a73bc-default-rtdb.firebaseio.com',
    storageBucket: 'belajar-firebase-a73bc.appspot.com',
    measurementId: 'G-R1323BP1GL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxVkUqsi0MeYn9p3XfdNe-2RxRLgix2a0',
    appId: '1:319212580240:android:77b1b6421d297f26a4195',
    messagingSenderId: '319212580240',
    projectId: 'belajar-firebase-a73bc',
    databaseURL:
        'https://belajar-firebase-a73bc-default-rtdb.firebaseio.com',
    storageBucket: 'belajar-firebase-a73bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2alo6Z-Gzypf9Gq2kXbr3-Ml6vDyp3-Yc',
    appId: '1:319212580240:ios:edd395528a78628e46a195',
    messagingSenderId: '319212580240',
    projectId: 'belajar-firebase-a73bc',
    databaseURL:
        'https://belajar-firebase-a73bc-default-rtdb.firebaseio.com',
    storageBucket: 'belajar-firebase-a73bc.appspot.com',
    iosBundleId: 'com.example.belajarFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2alo6Z-Gzypf9Gq2kXbr3-Ml6vDyp3-Yc',
    appId: '1:319212580240:ios:edd395528a78628e46a195',
    messagingSenderId: '319212580240',
    projectId: 'belajar-firebase-a73bc',
    databaseURL:
        'https://belajar-firebase-a73bc-default-rtdb.firebaseio.com',
    storageBucket: 'belajar-firebase-a73bc.appspot.com',
    iosBundleId: 'com.example.belajarFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDyVQQhE-WJd-6m6Z1vrlslp-kLwMYt0',
    appId: '1:319212580240:web:80071a1c62b8a6b846a195',
    messagingSenderId: '319212580240',
    projectId: 'belajar-firebase-a73bc',
    authDomain: 'belajar-firebase-a73bc.firebaseapp.com',
    databaseURL:
        'https://belajar-firebase-a73bc-default-rtdb.firebaseio.com',
    storageBucket: 'belajar-firebase-a73bc.appspot.com',
    measurementId: 'G-CPKZYPWYNV',
  );
}
