import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions{
  static FirebaseOptions get currentPlatform{
    return const FirebaseOptions(
      apiKey: 'AIzaSyBa3QiqNIFCs371VLivOTjC0I9T3SXAZW4',
      appId: '1:580250153593:android:50d1b0c36eb03dab5d1aa8',
      messagingSenderId: '580250153593',
      projectId: 'flutter-firebase-d4752',
      storageBucket: 'flutter-firebase-d4752.firebasestorage.app',);
  }
}

  // static const FirebaseOptions android = FirebaseOptions(
  //   apiKey: 'AIzaSyBa3QiqNIFCs371VLivOTjC0I9T3SXAZW4',
  //   appId: '1:580250153593:android:50d1b0c36eb03dab5d1aa8',
  //   messagingSenderId: '580250153593',
  //   projectId: 'flutter-firebase-d4752',
  //   storageBucket: 'flutter-firebase-d4752.firebasestorage.app',
  // );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyCqAfSnNy0rwb_fOpArMZxmqLFSx0WbOBM',
  //   appId: '1:580250153593:ios:1525bb1fa4b42c535d1aa8',
  //   messagingSenderId: '580250153593',
  //   projectId: 'flutter-firebase-d4752',
  //   storageBucket: 'flutter-firebase-d4752.firebasestorage.app',
  //   iosBundleId: 'com.example.flutterFirebase',
  // );
