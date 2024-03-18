// MaterialApp | Scaffold | Text | Center | Image | Icon

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Write whatever you want to show in screen
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Center(
        // child: Text(
        //   'Hello World. We are starting a new application from today askflsk flaksf lkslf k;slkf;lks lfksdlkf l;sklf sl;fk l;s;l',
        //   textAlign: TextAlign.center,
        //   maxLines: 1,
        //   style: TextStyle(
        //     fontSize: 24,
        //     fontWeight: FontWeight.w600,
        //     backgroundColor: Colors.purple,
        //     color: Colors.white,
        //     overflow: TextOverflow.ellipsis
        //   ),
        // ),
        // child: Icon(Icons.android, size: 84, color: Colors.green,),
        // child: Image.network(
        //   'https://picsum.photos/seed/picsum/536/354',
        //   width: 200,
        //   height: 300,
        //   fit: BoxFit.scaleDown,
        // ),
        // child: Image.asset('images/panda.jpg', width: 300, height: 300, fit: BoxFit.scaleDown, ),
      ),
    );
  }
}
