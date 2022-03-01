import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    return const FirebaseOptions(
      appId: '1:448618578101:android:3ad281c0067ccf97ac3efc',
      apiKey: 'AIzaSyCuu4tbv9CwwTudNOweMNstzZHIDBhgJxA',
      projectId: 'react-native-firebase-testing',
      messagingSenderId: '448618578101',
    );
  }
}
