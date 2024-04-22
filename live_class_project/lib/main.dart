import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: kDebugMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const Home(),
      theme: ThemeData(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          // Flexible(
          //   fit: FlexFit.tight,
          //   flex: 2,
          //   child: Container(
          //     width: 100,
          //     color: Colors.red,
          //   ),
          // ),
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     width: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          // Expanded(
          //   flex: 5,
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.green,
          //   ),
          // ),
          // SizedBox(
          //   width: MediaQuery.sizeOf(context).width,
          //   height: 500,
          //   child: FractionallySizedBox(
          //     heightFactor: 0.9,
          //     widthFactor: 0.8,
          //     child: Container(
          //       color: Colors.red,
          //     ),
          //   ),
          // )
          // 1:2
          AspectRatio(aspectRatio: 16/5, child: Container(color: Colors.red,),)
        ],
      ),
    );
  }
}




