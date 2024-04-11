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
   
  apiKey: "AIzaSyB1OaHqxdfIGq5iK0cam45RxBUiusz1XRQ",
  authDomain: "busprojectnavjot.firebaseapp.com",
  databaseURL: "https://busprojectnavjot-default-rtdb.firebaseio.com",
  projectId: "busprojectnavjot",
  storageBucket: "busprojectnavjot.appspot.com",
  messagingSenderId: "416827161913",
  appId: "1:416827161913:web:eb1bfbee658967a19a7ce8",
  measurementId: "G-M61ZHX0DPS"
  );

  static const FirebaseOptions android = FirebaseOptions(
  apiKey: "AIzaSyB1OaHqxdfIGq5iK0cam45RxBUiusz1XRQ",
  authDomain: "busprojectnavjot.firebaseapp.com",
  databaseURL: "https://busprojectnavjot-default-rtdb.firebaseio.com",
  projectId: "busprojectnavjot",
  storageBucket: "busprojectnavjot.appspot.com",
  messagingSenderId: "416827161913",
  appId: "1:416827161913:web:eb1bfbee658967a19a7ce8",
  measurementId: "G-M61ZHX0DPS"
  );

  static const FirebaseOptions ios = FirebaseOptions(
  apiKey: "AIzaSyB1OaHqxdfIGq5iK0cam45RxBUiusz1XRQ",
  authDomain: "busprojectnavjot.firebaseapp.com",
  databaseURL: "https://busprojectnavjot-default-rtdb.firebaseio.com",
  projectId: "busprojectnavjot",
  storageBucket: "busprojectnavjot.appspot.com",
  messagingSenderId: "416827161913",
  appId: "1:416827161913:web:eb1bfbee658967a19a7ce8",
  measurementId: "G-M61ZHX0DPS"
  );

  static const FirebaseOptions macos = FirebaseOptions(
  apiKey: "AIzaSyB1OaHqxdfIGq5iK0cam45RxBUiusz1XRQ",
  authDomain: "busprojectnavjot.firebaseapp.com",
  databaseURL: "https://busprojectnavjot-default-rtdb.firebaseio.com",
  projectId: "busprojectnavjot",
  storageBucket: "busprojectnavjot.appspot.com",
  messagingSenderId: "416827161913",
  appId: "1:416827161913:web:eb1bfbee658967a19a7ce8",
  measurementId: "G-M61ZHX0DPS"
  );
}
