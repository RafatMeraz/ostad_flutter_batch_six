import 'package:flutter/material.dart';
import 'package:live_class_project/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:live_class_project/firebase_notification_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotificationService.instance.initialize();
  runApp(const TodoApp());
}
