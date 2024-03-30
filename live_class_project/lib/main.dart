// Navigation - push, pop, replace, removeUntil (without named navigation)

// TODO: Study Stack DS

import 'package:flutter/material.dart';
import 'package:live_class_project/home.dart';
// import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}