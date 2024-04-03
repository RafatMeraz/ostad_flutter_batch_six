import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splash(),
      theme: ThemeData(),
    );
  }
}

/*
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(Icons.home),
        actions: [
          Icon(Icons.add)
        ],
      ),
      body: Center(
        child: Text(counter.toString(), style: TextStyle(
          fontSize: 48
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          print(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}*/




// Widget - 2 types
// Stateless Widget
// Stateful Widget
// State