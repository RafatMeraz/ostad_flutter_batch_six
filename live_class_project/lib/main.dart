// Scaffold | Column | Row | Dialog | bottom sheet | Snackbar

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      // debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// Column => Vertically
// Row => Horizontally

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Write whatever you want to show in screen
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home screen', style: TextStyle(
          color: Colors.white
        ),),
        leading: Icon(Icons.home_filled, color: Colors.white,),
        actions: [
          IconButton(onPressed: () {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Money has been transferred'),
            //     backgroundColor: Colors.green,
            //     duration: Duration(seconds: 1),
            //   ),
            // );
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text('Send money'),
                content: Text('Are you sure that you want to send money?'),
                actions: [

                ],
              );
            });
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello'),
            Text('World from Rafat'),
            Text('From'),
            Text('Ostad'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Greeting from '),
                Text('Ovi'),
                Text('-'),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Text('Date'),],
                    ),
                    Text('12-12-12'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
