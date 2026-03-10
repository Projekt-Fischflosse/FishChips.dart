import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC4AWOQ0fsNPkEBS-2Zn0PS9mnqDNFLeFo',
    appId: '1:1048935741394:web:cb06e5305f6097cb763a0b',
    messagingSenderId: '1048935741394',
    projectId: 'fischflosse-9ebcf',
    storageBucket: 'fischflosse-9ebcf.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4AWOQ0fsNPkEBS-2Zn0PS9mnqDNFLeFo',
    appId: '1:1048935741394:android:acb338abb0636342763a0b',
    messagingSenderId: '1048935741394',
    projectId: 'fischflosse-9ebcf',
    storageBucket: 'fischflosse-9ebcf.firebasestorage.app',
  );
}