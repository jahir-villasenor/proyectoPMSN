import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getFcmToken() async {
  if (Platform.isIOS) {
    String? formKey = await FirebaseMessaging.instance.getToken();
    return formKey;
  }
  String? formKey = await FirebaseMessaging.instance.getToken();
  return formKey;
}
