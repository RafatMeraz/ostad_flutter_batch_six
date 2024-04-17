// Aspect Ratio | Expanded | FractionallySizedBox

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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




