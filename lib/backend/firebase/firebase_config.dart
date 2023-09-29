import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCeY-eBIoV2sXQLoX5K-4XxS-J1WkZl5q4",
            authDomain: "myshopflutterflow.firebaseapp.com",
            projectId: "myshopflutterflow",
            storageBucket: "myshopflutterflow.appspot.com",
            messagingSenderId: "580689695512",
            appId: "1:580689695512:web:fa79ef5a9d970dfc66846d",
            measurementId: "G-4PLKSFLFX0"));
  } else {
    await Firebase.initializeApp();
  }
}
