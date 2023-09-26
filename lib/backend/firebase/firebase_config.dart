import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCnaqqKUKNDnw66BgjXgboHQ5mDW5qycZk",
            authDomain: "wrafi-studios.firebaseapp.com",
            projectId: "wrafi-studios",
            storageBucket: "wrafi-studios.appspot.com",
            messagingSenderId: "1053500937375",
            appId: "1:1053500937375:web:16292864d9765f3a0ebeaa",
            measurementId: "G-XX6VEL487S"));
  } else {
    await Firebase.initializeApp();
  }
}
